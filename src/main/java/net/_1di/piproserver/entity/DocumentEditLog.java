package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
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
public class DocumentEditLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 文档日志
     */
    private Integer docLogId;

    /**
     * 文档标识
     */
    private Integer documentId;

    /**
     * 文档日志内容
     */
    private String docLogContext;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}
