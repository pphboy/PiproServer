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
 * 权限
 * </p>
 *
 * @author pphboy
 * @since 2023-04-22
 */
@Getter
@Setter
@TableName("pi_authority")
@NoArgsConstructor
@ApiModel(value = "Authority对象", description = "权限")
public class Authority implements Serializable {

    private static final long serialVersionUID = 1L;

    public Authority( String authorityName, String authorityIntroduction) {
        this.authorityName = authorityName;
        this.authorityIntroduction = authorityIntroduction;
    }

    @ApiModelProperty("权限标识")
    @TableId(type = IdType.AUTO)
    private Integer authorityId;

    @ApiModelProperty("权限名")
    private String authorityName;

    @ApiModelProperty("权限介绍")
    private String authorityIntroduction;

    @ApiModelProperty("创建时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
