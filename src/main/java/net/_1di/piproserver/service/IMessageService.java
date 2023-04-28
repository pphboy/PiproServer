package net._1di.piproserver.service;

import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Message;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.enums.MessageEnums;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IMessageService extends IService<Message> {


    /**
     * 获取合法的信息
     * @return
     */
    Message getValidMessage(String messageId);

    /**
     * 发送一条信息
     * @param messageMaker
     * @param messageReceiver
     * @return
     */
    boolean sendMessage(Integer messageMaker, Integer messageReceiver, String title, String content);

    boolean sendMessage(Integer messageMaker, List<Integer> messageReceiverList, String title, String content);

    boolean sendMessageByBot( Integer messageReceiver, String title, String content);

    boolean sendMessageByBot( List<Integer> messageReceiverList, String title, String content);


    /**
     * 接收一条信息
     * @param messageId
     * @return
     */
    List<Message> getMessageListById(Integer messageId);
}
