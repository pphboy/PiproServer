package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
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
    @JsonIgnore
    private Integer projectStatus;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty("更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
