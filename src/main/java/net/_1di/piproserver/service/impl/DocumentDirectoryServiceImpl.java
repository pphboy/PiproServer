package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.annotations.cache.UpdateFileDirectoryCache;
import net._1di.piproserver.controller.api.file.vo.DeleteDirectoryVo;
import net._1di.piproserver.controller.api.file.vo.DirectoryVo;
import net._1di.piproserver.controller.api.file.vo.RenameDirectoryVo;
import net._1di.piproserver.entity.Document;
import net._1di.piproserver.entity.DocumentDirectory;
import net._1di.piproserver.enums.FileStatus;
import net._1di.piproserver.mapper.DocumentDirectoryMapper;
import net._1di.piproserver.service.IDocumentDirectoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.service.IDocumentService;
import net._1di.piproserver.utils.RedisUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
public class DocumentDirectoryServiceImpl extends ServiceImpl<DocumentDirectoryMapper, DocumentDirectory> implements IDocumentDirectoryService {

    @Autowired
    IDocumentService documentService;
    @Autowired
    RedisUtil redisUtil;

    @Override
    public List<DocumentDirectory> getDocumentDirectoriesByProjectId(Integer projectId) {
        List<DocumentDirectory> directories = list(new QueryWrapper<DocumentDirectory>().lambda()
                .eq(DocumentDirectory::getProjectId, projectId)
                // 只查询根目录
                .isNull(DocumentDirectory::getParentId)
                // 所有能查到的列表的结果都必须大于等于默认值
                .ge(DocumentDirectory::getFileDocumentStatus, FileStatus.DEFAULT.value)
        );
        // TODO: 把这个接口完成
        // 查询每个文件目录的子目录和子文件
        List<DocumentDirectory>  documentDirectories= new ArrayList<>();
        for(DocumentDirectory doc: directories){
            documentDirectories.add(getDocumentDirectoryById(doc.getDocumentDirectoryId()));
        }
        return documentDirectories;
    }

    @Override
    public void updateDirectoriesIntoCache(Integer projectId) {
        // 添加缓存
        redisUtil.set(getRedisKey(projectId),getDocumentDirectoriesByProjectId(projectId));
    }

    @Override
    public List<DocumentDirectory> getCacheDocumentDirectoriesByProjectId(Integer projectId) {
        Object object = redisUtil.get(getRedisKey(projectId));
        // 如果为空则更新
        if(ObjectUtils.isEmpty(object) ){
            updateDirectoriesIntoCache(projectId);
            object = redisUtil.get(getRedisKey(projectId));
        }
        return (List<DocumentDirectory>) object;
    }

    @Override
    public DocumentDirectory getDocumentDirectoryById(Integer directoryId) {
        // 为什么还需要在这里限制？因为这是一个单独的功能
        DocumentDirectory directory = getOne(new QueryWrapper<DocumentDirectory>().lambda()
                .eq(DocumentDirectory::getDocumentDirectoryId,directoryId)
                // 所有能查到的列表结果都必须大于等于默认值
                .ge(DocumentDirectory::getFileDocumentStatus,FileStatus.DEFAULT));

        List<DocumentDirectory> childDirectories = list(new QueryWrapper<DocumentDirectory>()
                .lambda().eq(DocumentDirectory::getParentId, directory.getDocumentDirectoryId())
                // 子目录也需要大于默认值
                .ge(DocumentDirectory::getFileDocumentStatus,FileStatus.DEFAULT));

        // 查询子文件
        directory.setDocumentList(documentService.list(new QueryWrapper<Document>()
                .lambda().eq(Document::getDocumentDirectoryId,directory.getDocumentDirectoryId())
                // 子文件必须大于等于默认值
                .ge(Document::getFileStatus,FileStatus.DEFAULT.value)));

        // 这里是一个递归，有多少层就查多少个
        if(ObjectUtils.isNotEmpty(childDirectories)){
            // 查询子目录
            List<DocumentDirectory> directories = new ArrayList<>();
            for (DocumentDirectory tmpD:childDirectories){
                directories.add(getDocumentDirectoryById(tmpD.getDocumentDirectoryId()));
            }
            directory.setChildDirectoryList(directories);
        }
        return directory;
    }

    @Override
    public DocumentDirectory getValidDirectory(Integer directoryId) {
        DocumentDirectory directory = getById(directoryId);
        // 显然不能为空
        if(ObjectUtils.isEmpty(directory)){
            return null;
        }
        // 权限不能小于0
        if(directory.getFileDocumentStatus() < 0){
            return null;
        }
        // 又是递归，父目录的父目录都不能是禁用状态
        // 父目录ID不为空的时候，父目录必须合法，不合法就是NULL
        if( ObjectUtils.isNotEmpty(directory.getParentId()) && ObjectUtils.isEmpty(getValidDirectory(directory.getParentId()))) return null;

        return directory;
    }

    @Override
    @UpdateFileDirectoryCache(type = "DOC")
    public boolean createDirectory(DirectoryVo directoryVo) {
        return save(new DocumentDirectory(directoryVo.getParentId(),directoryVo.getProjectId(),directoryVo.getDirectoryName()));
    }

    @Override
    @UpdateFileDirectoryCache(type = "DOC")
    public boolean renameDirectory(RenameDirectoryVo directoryVo) {
        DocumentDirectory documentDirectory= new DocumentDirectory(directoryVo.getDirectoryId(), directoryVo.getDirectoryName());

        return updateById(documentDirectory);
    }

    @Override
    @UpdateFileDirectoryCache(type = "DOC")
    public boolean deleteDirectory(DeleteDirectoryVo directoryVo) {
        DocumentDirectory documentDirectory= new DocumentDirectory(directoryVo.getDirectoryId(), directoryVo.getProjectId(),FileStatus.DELETE);
        return updateById(documentDirectory);
    }

    private String getRedisKey(Integer projectId){
        return  String.format("project:file-document:%d",projectId);
    }
}
