package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
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
public class Label implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 标签标识
     */
    private Integer labelId;

    /**
     * 项目标识
     */
    private Integer projectId;

    /**
     * 标签名
     */
    private String labelName;

    /**
     * 标签颜色
     */
    private String labelColor;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
