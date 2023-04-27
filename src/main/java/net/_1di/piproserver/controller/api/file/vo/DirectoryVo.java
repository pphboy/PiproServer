package net._1di.piproserver.controller.api.file.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.file.vo
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  07:33
 */
@Data
@Accessors(chain = true)
@ApiModel("文件夹创建类")
public class DirectoryVo {
    @NotNull(message = "项目ID不能为空")
    private Integer projectId;
    @NotEmpty(message = "创建文件名不能为空")
    private String directoryName;
    private Integer parentId;
}
