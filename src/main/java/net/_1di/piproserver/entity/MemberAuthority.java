package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 用户包含多个权限
 * </p>
 *
 * @author pphboy
 * @since 2023-04-22
 */
@Getter
@Setter
@TableName("pi_member_authority")
@ApiModel(value = "MemberAuthority对象", description = "用户包含多个权限")
public class MemberAuthority implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("会员标识")
    private Integer memberId;

    @ApiModelProperty("权限标识")
    private Integer authorityId;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;
}
