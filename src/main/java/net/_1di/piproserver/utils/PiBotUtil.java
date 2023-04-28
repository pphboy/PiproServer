package net._1di.piproserver.utils;

import net._1di.piproserver.entity.Member;
import org.springframework.stereotype.Component;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.utils
 * @Author: pphboy@qq.com
 * @Description: 机器人工具类
 * @CreateTime: 2023-04-28  16:44
 */
@Component
public class PiBotUtil {

    private Member bot = new Member().setMemberId(4);

    public Member getBot(){
        return bot;
    }
}
