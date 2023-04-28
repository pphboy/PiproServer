package net._1di.piproserver.controller.api.document.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.document.vo
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-28  08:57
 */
@ApiModel("文件创建值对象")
@Data
@Accessors(chain = true)
public class CreateDocumentVo {
    @ApiModelProperty("项目ID")
    @NotNull(message = "项目ID不能为空")
    private Integer projectId;
    @ApiModelProperty("目录ID")
    @NotNull(message = "目录ID不能为空")
    private Integer directoryId;
    @ApiModelProperty("文档标题")
    @NotEmpty(message = "文档标题不能为空")
    @Length(min = 1,message = "至少写点东西吧")
    private String documentTitle;
    @ApiModelProperty("文档内容")
    @NotEmpty(message = "文档内容不能为空")
    @Length(min = 6,message = "至少写点东西吧")
    private String documentContent;
}
