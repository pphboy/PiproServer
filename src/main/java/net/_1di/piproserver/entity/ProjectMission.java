package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
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
public class ProjectMission implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 任务标识
     */
    private Integer missionId;

    /**
     * 列表标识
     */
    private Integer kanbanListId;

    /**
     * 任务名
     */
    private String missionTitle;

    /**
     * 任务介绍
     */
    private String missionIntro;

    /**
     * 任务排序
     */
    private Integer missionOrder;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 开始时间
     */
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    private LocalDateTime endTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 删除状态
     */
    private Short deleteStatus;

    /**
     * 任务状态
     */
    private Short missionStatus;
}
