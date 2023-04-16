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
 * 文档操作日志
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_document_edit_log")
@ApiModel(value = "DocumentEditLog对象", description = "文档操作日志")
public class DocumentEditLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("文档日志")
    @TableId(type= IdType.ASSIGN_UUID)
    private String docLogId;

    @ApiModelProperty("文档标识")
    private Integer documentId;

    @ApiModelProperty("文档日志内容")
    private String docLogContext;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;
}
