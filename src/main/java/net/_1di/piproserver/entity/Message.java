package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 消息
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_message")
@ApiModel(value = "Message对象", description = "消息")
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("消息标识")
    @TableId(type = IdType.ASSIGN_UUID)
    private String messageId;

    @ApiModelProperty("信息接收者")
    private Integer messageRecieverMemberId;

    @ApiModelProperty("信息创建得")
    private Integer messageMakerMemberId;

    @ApiModelProperty("已读状态")
    private Short isRead;

    @ApiModelProperty("消息内容")
    private String messageContent;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("删除状态")
    private Short isDelete;
}
