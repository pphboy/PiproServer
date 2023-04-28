package net._1di.piproserver.controller.api.document.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.file.vo
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  12:35
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("删除文档值对象")
public class DeleteDocumentVo {
    @ApiModelProperty("文档ID")
    @NotNull
    private String documentId;
    @ApiModelProperty("项目ID")
    @NotNull
    private Integer projectId;
}
