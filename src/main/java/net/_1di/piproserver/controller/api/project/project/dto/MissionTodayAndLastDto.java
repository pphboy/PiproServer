package net._1di.piproserver.controller.api.project.project.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import net._1di.piproserver.entity.ProjectMission;

import java.util.List;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.project
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-24  22:44
 */
@Data
@Accessors(chain = true)
@ApiModel("任务列表")
public class MissionTodayAndLastDto {
    @ApiModelProperty("今天的任务")
    public List<ProjectMission> today;
    @ApiModelProperty("逾期的任务")
    public List<ProjectMission> overtime;
}
