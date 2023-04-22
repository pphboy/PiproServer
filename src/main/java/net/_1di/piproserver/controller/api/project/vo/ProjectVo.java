package net._1di.piproserver.controller.api.project.vo;

import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.vo
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-22  22:36
 */
@Data
@Accessors(chain = true)
public class ProjectVo {

    @NotEmpty
    @Length(max = 30,message = "项目名不能超过30个字")
    private String projectName;

    @NotEmpty
    @Length(max = 240,min = 6,message = "项目介绍，最少6个字，最多240个字")
    private String projectIntro;
}
