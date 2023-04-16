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
 * 项目任务
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_project_mission")
@ApiModel(value = "ProjectMission对象", description = "项目任务")
public class ProjectMission implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("任务标识")
    @TableId(type = IdType.ASSIGN_UUID)
    private String missionId;

    @ApiModelProperty("列表标识")
    private Integer kanbanListId;

    @ApiModelProperty("任务名")
    private String missionTitle;

    @ApiModelProperty("任务介绍")
    private String missionIntro;

    @ApiModelProperty("任务排序")
    private Integer missionOrder;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("开始时间")
    private LocalDateTime startTime;

    @ApiModelProperty("结束时间")
    private LocalDateTime endTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;

    @ApiModelProperty("删除状态")
    private Short deleteStatus;

    @ApiModelProperty("任务状态")
    private Short missionStatus;
}
