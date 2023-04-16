package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 文档目录
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_document_directory")
public class DocumentDirectory implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 文档目录标识
     */
    private Integer documentDirectoryId;

    /**
     * 项目标识
     */
    private Integer projectId;

    /**
     * 文件目录名
     */
    private String fileDirectoryTitle;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
