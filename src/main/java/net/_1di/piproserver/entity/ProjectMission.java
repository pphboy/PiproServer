package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
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
@NoArgsConstructor
@TableName("pi_project_mission")
@ApiModel(value = "ProjectMission对象", description = "项目任务")
public class ProjectMission implements Serializable {

    private static final long serialVersionUID = 1L;

    public ProjectMission(Integer kanbanListId, String missionTitle, String missionIntro, Integer missionOrder, LocalDateTime startTime, LocalDateTime endTime,Integer deleteStatus, Integer missionStatus) {
        this.kanbanListId = kanbanListId;
        this.missionTitle = missionTitle;
        this.missionIntro = missionIntro;
        this.missionOrder = missionOrder;
        this.startTime = startTime;
        this.endTime = endTime;
        this.deleteStatus = deleteStatus;
        this.missionStatus = missionStatus;
    }

    @ApiModelProperty("任务标识")
    @TableId(type = IdType.ASSIGN_UUID)
    private String missionId;

    @ApiModelProperty("列表标识")
    private Integer kanbanListId;

    @TableField(exist = false)
    private List<Member> memberList;

    @ApiModelProperty("任务名")
    private String missionTitle;

    @ApiModelProperty("任务介绍")
    private String missionIntro;

    @ApiModelProperty("任务排序")
    private Integer missionOrder;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty("开始时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    @ApiModelProperty("结束时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;

    @ApiModelProperty("更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @ApiModelProperty("删除状态")
    private Integer deleteStatus;

    @ApiModelProperty("任务状态")
    private Integer missionStatus;
}
