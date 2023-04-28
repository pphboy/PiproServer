package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.File;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net._1di.piproserver.enums.FileStatus;

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
@AllArgsConstructor
@NoArgsConstructor
public class DocumentDirectory implements Serializable {

    private static final long serialVersionUID = 1L;

    public DocumentDirectory(Integer parentId,Integer projectId,  String documentDirectoryTitle) {
        this.projectId = projectId;
        this.parentId = parentId;
        this.documentDirectoryTitle = documentDirectoryTitle;
    }

    public DocumentDirectory(Integer documentDirectoryId, String documentDirectoryTitle) {
        this.documentDirectoryId = documentDirectoryId;
        this.documentDirectoryTitle = documentDirectoryTitle;
    }

    public DocumentDirectory(Integer documentDirectoryId, Integer projectId, FileStatus fileStatus) {
        this.documentDirectoryId = documentDirectoryId;
        this.projectId = projectId;
        this.fileDocumentStatus = fileStatus.value;
    }

    @ApiModelProperty("文档目录标识")
    @TableId(type = IdType.AUTO)
    private Integer documentDirectoryId;

    @ApiModelProperty("项目标识")
    private Integer projectId;

    @ApiModelProperty("父文档目录")
    private Integer parentId;

    @TableField(exist = false)
    private List<DocumentDirectory> childDirectoryList;
    @TableField(exist = false)
    private List<Document> documentList;

    @ApiModelProperty("文件状态")
    private Integer fileDocumentStatus;

    @ApiModelProperty("文件目录名")
    private String documentDirectoryTitle;

    @ApiModelProperty("创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime createTime;

    /**
     * 上传文件和改名字这个就更新
     */
    @ApiModelProperty("更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime updateTime;
}
