package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.FileDirectory;
import net._1di.piproserver.mapper.FileDirectoryMapper;
import net._1di.piproserver.service.IFileDirectoryService;
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
public class FileDirectoryServiceImpl extends ServiceImpl<FileDirectoryMapper, FileDirectory> implements IFileDirectoryService {

}
