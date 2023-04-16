package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.OperationLog;
import net._1di.piproserver.mapper.OperationLogMapper;
import net._1di.piproserver.service.IOperationLogService;
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
public class OperationLogServiceImpl extends ServiceImpl<OperationLogMapper, OperationLog> implements IOperationLogService {

}
