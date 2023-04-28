package net._1di.piproserver.controller.api.document.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.file.vo
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  18:31
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("文件名更新")
public class UpdateDocumentVo {
    @ApiModelProperty("项目ID")
    @NotNull(message = "项目ID不能为空")
    private Integer projectId;
    @ApiModelProperty("文档ID")
    @NotNull(message = "文档ID不能为空")
    private String documentId;
    @ApiModelProperty("文档标题")
    @NotEmpty(message = "文档标题不能为空")
    @Length(min = 1,message = "至少写点东西吧")
    private String documentTitle;
    @ApiModelProperty("文档内容")
    @NotEmpty(message = "文档内容不能为空")
    private String documentContent;
}
