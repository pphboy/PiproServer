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
 * 文件目录
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_file_directory")
@ApiModel(value = "FileDirectory对象", description = "文件目录")
public class FileDirectory implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("文件目录标识")
    @TableId(type = IdType.AUTO)
    private Integer fileDirectoryId;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("文件目录名")
    private String fileDirectoryTitle;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;
}
