package net._1di.piproserver.controller.system.member.vo;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.system.member.vo
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-28  22:58
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("更新成员值")
public class UpdateMemberVo {
    @ApiModelProperty("邮箱")
    @NotEmpty(message = "邮箱不能为空")
    private String email;
    @ApiModelProperty("原本的密码")
    @NotEmpty(message = "原本的邮箱")
    private String originalPassword;
    @ApiModelProperty("密码")
    private String password;
    @ApiModelProperty("确认密码")
    private String repassword;
}
