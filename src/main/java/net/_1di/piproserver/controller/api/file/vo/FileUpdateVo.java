package net._1di.piproserver.controller.api.file.vo;

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
public class FileUpdateVo{
    @ApiModelProperty("文件ID")
    @NotNull(message = "文件ID不能为空")
    private Integer fileId;
    @Length(max = 200,min=1)
    @NotEmpty(message = "文件名不能为空")
    private String filename;
    @ApiModelProperty("项目ID")
    @NotNull(message = "项目ID不能为空")
    private Integer projectId;
}
