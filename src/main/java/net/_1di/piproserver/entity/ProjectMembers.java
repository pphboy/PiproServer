package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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
@NoArgsConstructor
@AllArgsConstructor
public class ProjectMembers implements Serializable {

    private static final long serialVersionUID = 1L;

    public ProjectMembers(Integer projectId, Integer memberId, Integer projectAuthority) {
        this.projectId = projectId;
        this.memberId = memberId;
        this.projectAuthority = projectAuthority;
    }

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("会员标识")
    private Integer memberId;

    /**
     * 项目创建者：100
     * 	项目加入者: 0
     * 	禁用者：-1
     * 	踢除： -2
     */
    @ApiModelProperty("权限")
    private Integer projectAuthority;

    @ApiModelProperty("创建时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
