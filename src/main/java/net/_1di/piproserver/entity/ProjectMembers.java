package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
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
public class ProjectMembers implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 项目标识
     */
    private Integer projectId;

    /**
     * 会员标识
     */
    private Integer memberId;

    /**
     * 权限
     */
    private Short projectAuthority;

    /**
     * 用户状态
     */
    private Short memberStatus;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
