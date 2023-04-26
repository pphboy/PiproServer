package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.entity.File;
import net._1di.piproserver.entity.FileDirectory;
import net._1di.piproserver.mapper.FileDirectoryMapper;
import net._1di.piproserver.service.IFileDirectoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.service.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.stereotype.Service;

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
public class FileDirectoryServiceImpl extends ServiceImpl<FileDirectoryMapper, FileDirectory> implements IFileDirectoryService {
    @Autowired
    IFileService fileService;

    @Override
    public List<FileDirectory> getFileDirectoriesByProjectId(Integer projectId) {
        List<FileDirectory> directories = list(new QueryWrapper<FileDirectory>().lambda().eq(
                FileDirectory::getProjectId, projectId
        ));
        // TODO: 把这个接口完成
        // 查询每个文件目录的子目录和子文件
        for (FileDirectory tmp: directories){
            // 查询子目录
            tmp.setChildDirectoryList(
                    list(new QueryWrapper<FileDirectory>()
                            .lambda().eq(FileDirectory::getParentId,tmp.getFileDirectoryId())));
            // 查询子文件
            tmp.setFileList(fileService.list(new QueryWrapper<File>()
                    .lambda().eq(File::getFileDirectoryId,tmp.getFileDirectoryId())));
        }
        return directories;
    }
}
