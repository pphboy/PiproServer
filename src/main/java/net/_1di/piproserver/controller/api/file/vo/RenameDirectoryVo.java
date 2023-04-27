package net._1di.piproserver.controller.api.file.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

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
public class RenameDirectoryVo {
    @NotNull(message = "文件列表ID不能为空")
    private Integer directoryId;
    @NotNull(message = "项目ID不能为空")
    private Integer projectId;
    @NotEmpty(message = "列表名")
    @Length(max = 100,message = "长度不超过100字符")
    private String directoryName;

}
