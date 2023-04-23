package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * <p>
 * 项目标签
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_label")
@ApiModel(value = "Label对象", description = "项目标签")
@NoArgsConstructor
@AllArgsConstructor
public class Label implements Serializable {

    private static final long serialVersionUID = 1L;


    public Label(Integer projectId, String labelName, String labelColor) {
        this.projectId = projectId;
        this.labelName = labelName;
        this.labelColor = labelColor;
    }

    public Label( String labelName, String labelColor,Integer labelId) {
        this.labelId = labelId;
        this.labelName = labelName;
        this.labelColor = labelColor;
    }


    public Label(String labelName, String labelColor) {
        this.labelName = labelName;
        this.labelColor = labelColor;
    }

    @ApiModelProperty("标签标识")
    @TableId(value = "label_id", type = IdType.AUTO)
    private Integer labelId;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("标签名")
    private String labelName;

    @ApiModelProperty("标签颜色")
    private String labelColor;

    @ApiModelProperty("创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;
}
