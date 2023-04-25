package net._1di.piproserver.controller.api.project.project.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import net._1di.piproserver.entity.Project;
import net._1di.piproserver.entity.ProjectMission;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.project.project.dto
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-25  10:09
 */
@Data
@Accessors(chain = true)
@ApiModel("项目的封装文件")
@NoArgsConstructor
@AllArgsConstructor
public class ProjectMissionDto {

    @ApiModelProperty("所在项目")
    private Project project;
    @ApiModelProperty("任务名")
    private ProjectMission projectMission;
}
