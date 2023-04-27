package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.cache.UpdateFileDirectoryCache;
import net._1di.piproserver.controller.api.file.dto.FileDto;
import net._1di.piproserver.controller.api.file.vo.DeleteFileVo;
import net._1di.piproserver.controller.api.file.vo.FileUpdateVo;
import net._1di.piproserver.entity.File;
import net._1di.piproserver.enums.FileStatus;
import net._1di.piproserver.mapper.FileMapper;
import net._1di.piproserver.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
@Slf4j
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {

    @Autowired
    FileUtil fileUtil;

    @Override
    @UpdateFileDirectoryCache(type = "FILE")
    public boolean saveFile(FileDto file) throws IOException {
        try{
            return save(new File(file.getMember().getMemberId(),file.getDirectoryId(),file.getFile().getOriginalFilename()
                    ,fileUtil.saveMultipartFile(file.getFile(),file.getProjectId())));
        }catch (Exception e){
            log.error("用户【{}】 上传文件[{}] 到 目录[{}]失败",file.getMember().getMemberId(),file.getFile().getOriginalFilename(),file.getDirectoryId());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public File getValidFile(Integer fileId) {
        return getOne(new QueryWrapper<File>().lambda().eq(File::getFileId, fileId).eq(File::getFileStatus, FileStatus.DEFAULT.value));
    }

    @Override
    @UpdateFileDirectoryCache(type = "FILE")
    public boolean deleteFile(DeleteFileVo deleteFileVo) {
        return updateById(new File().setFileId(deleteFileVo.getFileId()).setFileStatus(FileStatus.DELETE.value));
    }

    @Override
    @UpdateFileDirectoryCache(type = "FILE")
    public boolean fileRename(FileUpdateVo fileUpdateVo) {
        return updateById(new File().setFileId(fileUpdateVo.getFileId()).setFilename(fileUpdateVo.getFilename()));
    }
}
