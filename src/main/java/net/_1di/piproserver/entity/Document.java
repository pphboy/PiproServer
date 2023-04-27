package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "Document对象", description = "文档")
public class Document implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("文档标识")
    @TableId(type= IdType.ASSIGN_UUID)
    private String documentId;

    @ApiModelProperty("文档目录标识")
    private Integer documentDirectoryId;

    @ApiModelProperty("文档状态")
    private Integer fileStatus;

    @ApiModelProperty("文档标题")
    private String documentTitle;

    @ApiModelProperty("文档内容")
    private String documentContent;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime createTime;
}
