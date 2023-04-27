package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.annotations.cache.UpdateFileDirectoryCache;
import net._1di.piproserver.controller.api.file.vo.DeleteDirectoryVo;
import net._1di.piproserver.controller.api.file.vo.DirectoryVo;
import net._1di.piproserver.controller.api.file.vo.RenameDirectoryVo;
import net._1di.piproserver.entity.File;
import net._1di.piproserver.entity.FileDirectory;
import net._1di.piproserver.enums.FileStatus;
import net._1di.piproserver.mapper.FileDirectoryMapper;
import net._1di.piproserver.service.IFileDirectoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.service.IFileService;
import net._1di.piproserver.utils.RedisUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
public class FileDirectoryServiceImpl extends ServiceImpl<FileDirectoryMapper, FileDirectory> implements IFileDirectoryService {
    @Autowired
    IFileService fileService;
    @Autowired
    RedisUtil redisUtil;

    @Override
    @Cacheable
    public List<FileDirectory> getFileDirectoriesByProjectId(Integer projectId) {
        List<FileDirectory> directories = list(new QueryWrapper<FileDirectory>().lambda()
                .eq(FileDirectory::getProjectId, projectId)
                // 只查询根目录
                .isNull(FileDirectory::getParentId)
                // 所有能查到的列表的结果都必须大于等于默认值
                .ge(FileDirectory::getFileDocumentStatus, FileStatus.DEFAULT.value)
        );
        // TODO: 把这个接口完成
        // 查询每个文件目录的子目录和子文件
        List<FileDirectory> fileDirectories = new ArrayList<>();
        for(FileDirectory f: directories){
            fileDirectories.add(getFileDirectoryById(f.getFileDirectoryId()));
        }
        return fileDirectories;
    }

    @Override
    public void updateDirectoriesIntoCache(Integer projectId) {
        // 添加缓存
        redisUtil.set(getRedisKey(projectId),getFileDirectoriesByProjectId(projectId));
    }

    @Override
    public List<FileDirectory> getCacheFileDirectoriesByProjectId(Integer projectId) {
        Object object = redisUtil.get(String.format(getRedisKey(projectId), projectId));
        // 如果为空则更新
        if(ObjectUtils.isEmpty(object) ){
            updateDirectoriesIntoCache(projectId);
            object = redisUtil.get(String.format(getRedisKey(projectId), projectId));
        }
        return (List<FileDirectory>) object;
    }


    @Override
    public FileDirectory getFileDirectoryById(Integer directoryId) {
        // 为什么还需要在这里限制？因为这是一个单独的功能
        FileDirectory directory = getOne(new QueryWrapper<FileDirectory>().lambda()
                .eq(FileDirectory::getFileDirectoryId,directoryId)
                // 所有能查到的列表结果都必须大于等于默认值
                .ge(FileDirectory::getFileDocumentStatus,FileStatus.DEFAULT));

        List<FileDirectory> childDirectories = list(new QueryWrapper<FileDirectory>()
                .lambda().eq(FileDirectory::getParentId, directory.getFileDirectoryId())
                // 子目录也需要大于默认值
                .ge(FileDirectory::getFileDocumentStatus,FileStatus.DEFAULT));

        // 查询子文件
        directory.setFileList(fileService.list(new QueryWrapper<File>()
                .lambda().eq(File::getFileDirectoryId,directory.getFileDirectoryId())
                // 子文件必须大于等于默认值
                .ge(File::getFileStatus,FileStatus.DEFAULT.value)));

        // 这里是一个递归，有多少层就查多少个
        if(ObjectUtils.isNotEmpty(childDirectories)){
            // 查询子目录
            List<FileDirectory> directories = new ArrayList<>();
            for (FileDirectory tmpF:childDirectories){
                directories.add(getFileDirectoryById(tmpF.getFileDirectoryId()));
            }
            directory.setChildDirectoryList(directories);
        }

        return directory;
    }


    @Override
    public FileDirectory getValidDirectory(Integer directoryStatus) {
        FileDirectory directory = getById(directoryStatus);
        // 显然不能为空
        if(ObjectUtils.isEmpty(directory)){
            return null;
        }
        // 权限不能小于0
        if(directory.getFileDocumentStatus() < 0){
            return null;
        }
        return directory;
    }

    @Override
    @UpdateFileDirectoryCache(type = "FILE")
    public boolean createDirectory(DirectoryVo directoryVo) {
        return save(new FileDirectory(directoryVo.getParentId(),directoryVo.getProjectId(),directoryVo.getDirectoryName()));
    }

    @Override
    @UpdateFileDirectoryCache(type = "FILE")
    public boolean renameDirectory(RenameDirectoryVo directoryVo) {
        FileDirectory fileDirectory = new FileDirectory(directoryVo.getDirectoryId(), directoryVo.getDirectoryName());

        return updateById(fileDirectory);
    }

    @Override
    @UpdateFileDirectoryCache(type = "FILE")
    public boolean deleteDirectory(DeleteDirectoryVo directoryVo) {
        FileDirectory fileDirectory = new FileDirectory(directoryVo.getDirectoryId(), directoryVo.getProjectId(),FileStatus.DELETE);
        return updateById(fileDirectory);
    }

    private String getRedisKey(Integer projectId){
        return  String.format("project:file-directory:%d",projectId);
    }


}
