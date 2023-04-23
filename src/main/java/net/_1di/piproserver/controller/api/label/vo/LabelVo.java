package net._1di.piproserver.controller.api.label.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import net._1di.piproserver.annotations.valid.InValues;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.ScriptAssert;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.label.vo
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-23  10:25
 */
@Data
@Accessors(chain = true)
public class LabelVo {
    @NotNull
    private Integer projectId;

    @NotEmpty
    private String labelName;

    private Integer labelId;

    @NotEmpty
    @InValues(values = {"danger","primary","info","success","warning"})
    private String labelColor;
}
