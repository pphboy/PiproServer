package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

/**
 * <p>
 * 看板列表
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_kanban_list")
@ApiModel(value = "KanbanList对象", description = "看板列表")
@ToString
@Accessors(chain = true)
@NoArgsConstructor
public class KanbanList implements Serializable {

    private static final long serialVersionUID = 1L;

    public KanbanList(Integer projectId, String listName) {
        this.projectId = projectId;
        this.listName = listName;
    }

    @ApiModelProperty("列表标识")
    @TableId(value = "kanban_list_id", type = IdType.AUTO)
    private Integer kanbanListId;

    @TableField(exist = false)
    private List<ProjectMission> missionList;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("列表名")
    private String listName;

    @ApiModelProperty("创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    @JsonIgnore
    @ApiModelProperty("看板状态")
    private Integer kanbanStatus;
}
