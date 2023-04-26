package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 文件
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_file")
@ApiModel(value = "File对象", description = "文件")
@Accessors(chain = true)
public class File implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("文档标识")
    @TableId(type= IdType.ASSIGN_UUID)
    private String fileId;

    @ApiModelProperty("会员标识")
    @JsonIgnore
    private Integer memberId;

    @TableField(exist = false)
    private Member member;

    @ApiModelProperty("文件目录标识")
    private Integer fileDirectoryId;

    @ApiModelProperty("文件名")
    private String filename;

    @ApiModelProperty("文件路径")
    private String filePath;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
