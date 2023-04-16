package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 任务拥有多个标签
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_project_mission_rela_label")
public class ProjectMissionRelaLabel implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 标签标识
     */
    private Integer labelId;

    /**
     * 任务标识
     */
    private Integer missionId;
}
