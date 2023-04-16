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
 * 操作日志
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_operation_log")
@ApiModel(value = "OperationLog对象", description = "操作日志")
public class OperationLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("操作日志标识")
    @TableId(value = "operation_log_id", type = IdType.AUTO)
    private Long operationLogId;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("权限类型")
    private String authorityType;

    @ApiModelProperty("操作内容")
    private String operationContext;

    @ApiModelProperty("操作时间")
    private LocalDateTime operateTime;
}
