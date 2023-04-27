package net._1di.piproserver.controller.api.file.vo;

import io.swagger.annotations.ApiModel;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.file.vo
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  10:27
 */
@ApiModel("文件上传值对象")
public class FileUploadVo {
    @NotNull(message = "文件列表ID不能为空")
    private Integer directoryId;
    @NotNull(message = "项目ID不能为空")
    private Integer projectId;
    @NotNull(message = "文件不能为空")
    private MultipartFile file;
}
