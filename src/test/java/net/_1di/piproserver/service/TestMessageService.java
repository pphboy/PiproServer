package net._1di.piproserver.service;

import net._1di.piproserver.entity.Member;
import net._1di.piproserver.utils.PiBotUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.service
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-28  16:30
 */
@SpringBootTest
public class TestMessageService {

    @Autowired
    IMessageService messageService;

    @Autowired
    PiBotUtil piBotUtil;

    @Test
    public void testSendMessage(){
        messageService.sendMessage(piBotUtil.getBot().getMemberId(),3,"消息标题","消息内容");
    }

    @Test
    public void testSendMessageToMemberList(){
        List<Integer> mlist = List.of(4, 5, 6, 7);
        messageService.sendMessage(piBotUtil.getBot().getMemberId(),mlist ,"消息标题","消息内容");
    }
}
