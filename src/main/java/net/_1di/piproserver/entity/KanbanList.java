package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

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
public class KanbanList implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("列表标识")
    @TableId(value = "kanban_list_id", type = IdType.AUTO)
    private Integer kanbanListId;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("列表名")
    private String listName;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;
}
