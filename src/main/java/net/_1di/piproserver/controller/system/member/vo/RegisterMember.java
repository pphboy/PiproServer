package net._1di.piproserver.controller.system.member.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.vo
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  15:56
 */

@Data
@ApiModel("注册用户包装类")
public class RegisterMember {

    @ApiModelProperty("用户名")
    @NotEmpty(message = "用户名不能为空")
//    @Length(max = 10,min = 6,message = "用户名在6~10位之间")
    @Length(max = 50,min = 6,message = "用户名在6~10位之间")
    private String username;

    @ApiModelProperty("密码")
    @NotEmpty(message = "密码不能为空")
    @Length(max = 16,min = 6,message = "密码在6~16之间")
    private String password;

    @ApiModelProperty("邮箱")
    @Email
    @NotEmpty(message = "邮箱不能为空")
    @Length(max = 30,min = 6,message = "正常邮箱号在6~30之间")
    private String email;
}
