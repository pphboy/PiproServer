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
 * 项目创建与参与关系
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_project_members")
@ApiModel(value = "ProjectMembers对象", description = "项目创建与参与关系")
public class ProjectMembers implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("会员标识")
    private Integer memberId;

    @ApiModelProperty("权限")
    private Short projectAuthority;

    @ApiModelProperty("用户状态")
    private Short memberStatus;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;
}
