package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "ProjectMissionRelaLabel对象", description = "任务拥有多个标签")
public class ProjectMissionRelaLabel implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("标签标识")
    @TableId(type = IdType.AUTO)
    private Integer labelId;

    @ApiModelProperty("任务标识")
    private Integer missionId;
}
