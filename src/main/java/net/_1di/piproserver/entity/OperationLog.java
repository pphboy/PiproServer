package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 操作日志
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_operation_log")
public class OperationLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 操作日志标识
     */
    private Integer operationLogId;

    /**
     * 项目标识
     */
    private Integer projectId;

    /**
     * 权限类型
     */
    private String authorityType;

    /**
     * 操作内容
     */
    private String operationContext;

    /**
     * 操作时间
     */
    private LocalDateTime operateTime;
}
