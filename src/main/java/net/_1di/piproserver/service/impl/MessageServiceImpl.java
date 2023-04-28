package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Message;
import net._1di.piproserver.enums.MessageEnums;
import net._1di.piproserver.enums.MessageStatus;
import net._1di.piproserver.mapper.MessageMapper;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.service.IMessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.utils.PiBotUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Slf4j
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements IMessageService {
    @Autowired
    IMemberService memberService;

    @Autowired
    PiBotUtil piBotUtil;

    @Override
    public Message getValidMessage(String messageId) {
        return getOne(new QueryWrapper<Message>().lambda().eq(Message::getMessageStatus,MessageStatus.DEFAULT.value).eq(Message::getMessageId,messageId));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean sendMessage(Integer messageMaker, Integer messageReceiver, String title, String content) {
        Message message = new Message( messageReceiver,messageMaker, title, content);
        return save(message);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean sendMessage(Integer messageMaker, List<Integer> messageReceiverList, String title, String content) {
        for (Integer receiver: messageReceiverList){
            Message message = new Message(receiver,messageMaker,  title, content);
            if(!save(message)){
                throw new RuntimeException("消息添加,系统错误");
            }
        }
        return true;
    }

    @Override
    public boolean sendMessageByBot(Integer messageReceiver, String title, String content) {
        Message message = new Message(messageReceiver,piBotUtil.getBot().getMemberId(),  title, content);
        return save(message);
    }

    @Override
    public boolean sendMessageByBot(List<Integer> messageReceiverList, String title, String content) {
        for (Integer receiver: messageReceiverList){
            Message message = new Message(receiver,piBotUtil.getBot().getMemberId(),  title, content);
            if(!save(message)){
                throw new RuntimeException("消息添加,系统错误");
            }
        }
        return true;
    }


    @Override
    public List<Message> getMessageListById(Integer memberId) {
        List<Message> messageList = list(new QueryWrapper<Message>().lambda()
                .eq(Message::getMessageReceiverMemberId, memberId)
                // 必须是未读的默认的状态
                .ge(Message::getMessageStatus, MessageStatus.DEFAULT.value)
                .orderByDesc(Message::getCreateTime)
        );
        for (Message message : messageList) {
            message.setMemberMaker(memberService.getById(message.getMessageMakerMemberId()));
        }
        return messageList;
    }
}
