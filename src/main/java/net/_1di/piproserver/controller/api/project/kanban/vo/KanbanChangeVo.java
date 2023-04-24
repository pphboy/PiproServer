package net._1di.piproserver.controller.api.project.kanban.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.project.kanban.vo
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-24  10:37
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "看板修改VO")
public class KanbanChangeVo {
    @NotEmpty(message = "任务字段必填")
    @ApiModelProperty("任务ID")
    private String missionId;
    @NotNull(message = "看板ID必填 ")
    @ApiModelProperty("转移看板ID")
    private Integer toKanbanId;
}
