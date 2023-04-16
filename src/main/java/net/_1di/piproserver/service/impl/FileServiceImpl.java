package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.File;
import net._1di.piproserver.mapper.FileMapper;
import net._1di.piproserver.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {

}
