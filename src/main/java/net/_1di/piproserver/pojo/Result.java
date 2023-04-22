package net._1di.piproserver.pojo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "Result", description = "系统的返回结果")
public class Result {

    @ApiModelProperty("系统操作码")
    private int code;
    @ApiModelProperty("本次操作状态")
    private boolean status;
    @ApiModelProperty("系统返回消息")
    private String message;
    @ApiModelProperty("数据")
    private Object data;
}
