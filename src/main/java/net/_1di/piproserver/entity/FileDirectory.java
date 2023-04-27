package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
import lombok.experimental.Accessors;
import net._1di.piproserver.enums.FileStatus;

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
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class FileDirectory implements Serializable {

    private static final long serialVersionUID = 1L;


    public FileDirectory(Integer parentId, Integer projectId, String fileDirectoryTitle) {
        this.parentId = parentId;
        this.projectId = projectId;
        this.fileDirectoryTitle = fileDirectoryTitle;
    }

    public FileDirectory(Integer fileDirectoryId, String fileDirectoryTitle) {
        this.fileDirectoryId = fileDirectoryId;
        this.fileDirectoryTitle = fileDirectoryTitle;
    }

    public FileDirectory(Integer fileDirectoryId, Integer projectId,FileStatus fileStatus) {
        this.fileDirectoryId = fileDirectoryId;
        this.projectId = projectId;
        this.fileDocumentStatus = fileStatus.value;
    }

    @ApiModelProperty("文件目录标识")
    @TableId(type = IdType.AUTO)
    private Integer fileDirectoryId;

    @TableField(exist = false)
    private List<FileDirectory> childDirectoryList;

    @ApiModelProperty("文件状态")
    private Integer fileDocumentStatus;

    @TableField(exist = false)
    private List<File> fileList;

    @ApiModelProperty("项目父目录ID")
    private Integer parentId;

    @ApiModelProperty("项目标识")
    @JsonIgnore
    private Integer projectId;

    @ApiModelProperty("文件目录名")
    private String fileDirectoryTitle;

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
