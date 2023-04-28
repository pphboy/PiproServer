package net._1di.piproserver.controller.api.member;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Message;
import net._1di.piproserver.enums.MessageStatus;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IMessageService;
import net._1di.piproserver.utils.ResultUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@RestController
@RequestMapping("/project/message")
@Api(tags = "信息接口")
@VerifyToken
@Slf4j
public class MessageController {
    @Autowired
    IMessageService messageService;
    @Autowired
    ResultUtil resultUtil;

    @GetMapping
    public Result getMessageList(@RequestAttribute("member")Member member){
        return resultUtil.success("获取列表成功",messageService.getMessageListById(member.getMemberId()));
    }

    @GetMapping("/{id}")
    public Result readOneMessage(@RequestAttribute("member") Member member,@PathVariable("id")String messageId){
        if(ObjectUtils.isEmpty(messageService.getValidMessage(messageId))){
            log.info("用户[{}] 正在已读一条不存在的消息 {}",member.getMemberId(),messageId);
            return resultUtil.fail("消息不存在");
        }
        messageService.update(new UpdateWrapper<Message>().lambda()
                .eq(Message::getMessageReceiverMemberId,member.getMemberId())
                .eq(Message::getMessageId,messageId)
                .set(Message::getMessageStatus, MessageStatus.IS_READ.value));
        return resultUtil.success("设置信息已读成功");
    }

    @GetMapping("/all")
    public Result readMemberAllMessage(@RequestAttribute("member") Member member){
        messageService.update(new UpdateWrapper<Message>().lambda()
                .eq(Message::getMessageReceiverMemberId,member.getMemberId())
                // 让所有未读的消息已读
                        .eq(Message::getMessageStatus,MessageStatus.DEFAULT.value)
                .set(Message::getMessageStatus, MessageStatus.IS_READ.value));
        return resultUtil.success("更新信息列表成功");
    }

    @DeleteMapping
    public Result deleteMemberAllMessage(@RequestAttribute("member") Member member){
        messageService.update(new UpdateWrapper<Message>().lambda().eq(Message::getMessageReceiverMemberId,member.getMemberId()).set(Message::getMessageStatus, MessageStatus.DELETE.value));
        return resultUtil.success("删除信息列表成功");
    }

}
