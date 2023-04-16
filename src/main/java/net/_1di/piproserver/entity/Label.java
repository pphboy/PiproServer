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
public class Label implements Serializable {

    private static final long serialVersionUID = 1L;

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
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;
}
