package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.file.dto.FileDto;
import net._1di.piproserver.entity.File;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.IOException;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IFileService extends IService<File> {

    /**
     * 保存一个文件
     * @param file 文件封装类
     * @return
     */
    boolean saveFile(FileDto file) throws IOException;
}
