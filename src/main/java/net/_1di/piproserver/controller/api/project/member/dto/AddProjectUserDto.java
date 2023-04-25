package net._1di.piproserver.controller.api.project.member.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import net._1di.piproserver.entity.Member;

import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.project.member.dto
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-25  19:57
 */

@Data
@Accessors(chain = true)
@ApiModel("添加用户到本项目中")
public class AddProjectUserDto {
    @ApiModelProperty("用户ID")
    @NotNull(message = "成员ID不能为空")
    private Integer memberId;
    @ApiModelProperty("项目ID")
    @NotNull(message = "项目ID不能为空")
    private Integer projectId;
}
