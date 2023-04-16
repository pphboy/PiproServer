package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 用户
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_member")
public class Member implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 会员标识
     */
    private Integer memberId;

    /**
     * 会员登录名
     */
    private String memberName;

    /**
     * 密码
     */
    private String password;

    /**
     * 盐
     */
    private String salt;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 权限类型
     */
    private String authorityType;

    /**
     * 注册时间
     */
    private LocalDateTime registerTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
