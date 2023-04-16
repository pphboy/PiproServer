package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 文档
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_document")
public class Document implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 文档标识
     */
    private Integer documentId;

    /**
     * 文档目录标识
     */
    private Integer documentDirectoryId;

    /**
     * 文件名
     */
    private String filename;

    /**
     * 文件路径
     */
    private String filePath;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}
