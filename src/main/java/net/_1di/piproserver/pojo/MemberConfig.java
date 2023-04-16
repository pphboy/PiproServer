package net._1di.piproserver.pojo;

import io.swagger.annotations.Api;
import lombok.Data;
import lombok.experimental.Accessors;
import net._1di.piproserver.entity.Member;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.pojo
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  16:37
 */
@Data
@Accessors(chain = true)
public class MemberConfig {

    private Member member;

    private String token;
}
