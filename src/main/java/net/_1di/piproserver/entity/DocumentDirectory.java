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
 * 文档目录
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_document_directory")
@ApiModel(value = "DocumentDirectory对象", description = "文档目录")
public class DocumentDirectory implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("文档目录标识")
    @TableId(type = IdType.AUTO)
    private Integer documentDirectoryId;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("父文档目录")
    private Integer parentId;

    @ApiModelProperty("文件目录名")
    private String fileDirectoryTitle;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;
}
