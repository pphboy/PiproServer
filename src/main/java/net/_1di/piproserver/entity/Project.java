package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * <p>
 * 项目
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_project")
@ApiModel(value = "Project对象", description = "项目")
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Project implements Serializable {

    private static final long serialVersionUID = 1L;

    public Project(String projectName, String projectIntro, Integer projectStatus) {
        this.projectName = projectName;
        this.projectIntro = projectIntro;
        this.projectStatus = projectStatus;
    }

    @ApiModelProperty("项目标识")
    @TableId(value = "project_id", type = IdType.AUTO)
    private Integer projectId;

    @ApiModelProperty("项目名")
    private String projectName;

    @ApiModelProperty("项目介绍")
    private String projectIntro;

    @ApiModelProperty("项目状态")
    private Integer projectStatus;

    @ApiModelProperty("创建时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
