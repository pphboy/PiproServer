package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.DocumentEditLog;
import net._1di.piproserver.mapper.DocumentEditLogMapper;
import net._1di.piproserver.service.IDocumentEditLogService;
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
public class DocumentEditLogServiceImpl extends ServiceImpl<DocumentEditLogMapper, DocumentEditLog> implements IDocumentEditLogService {

}
