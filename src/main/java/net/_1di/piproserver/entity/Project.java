package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

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
public class Project implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 项目标识
     */
    private Integer projectId;

    /**
     * 项目名
     */
    private String projectName;

    /**
     * 项目介绍
     */
    private String projectIntro;

    /**
     * 项目状态
     */
    private Short projectStatus;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
