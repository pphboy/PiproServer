package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.Message;
import net._1di.piproserver.mapper.MessageMapper;
import net._1di.piproserver.service.IMessageService;
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
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements IMessageService {

}
