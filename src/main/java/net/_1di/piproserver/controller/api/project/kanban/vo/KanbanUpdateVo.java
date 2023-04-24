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
 * @CreateTime: 2023-04-24  20:26
 * P
 */
@Accessors(chain = true)
@Data
@ApiModel("创建看板使用的Vo")
public class KanbanUpdateVo {
    @ApiModelProperty("看板名")
    @NotEmpty(message = "看板名称不能为容")
    private String kanbanName;

    @NotNull(message = "看板ID不能为空")
    @ApiModelProperty("看板ID")
    private Integer kanbanId;
}
