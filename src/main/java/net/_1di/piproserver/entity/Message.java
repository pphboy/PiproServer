package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "Message对象", description = "消息")
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    public Message( Integer messageReceiverMemberId, Integer messageMakerMemberId, String messageTitle, String messageContent) {
        this.messageReceiverMemberId = messageReceiverMemberId;
        this.messageMakerMemberId = messageMakerMemberId;
        this.messageTitle = messageTitle;
        this.messageContent = messageContent;
    }
    @TableField(exist = false)
    private Member memberMaker;

    @ApiModelProperty("消息标识")
    @TableId(type = IdType.ASSIGN_UUID)
    private String messageId;

    @ApiModelProperty("信息接收者")
    private Integer messageReceiverMemberId;

    @ApiModelProperty("信息创建得")
    private Integer messageMakerMemberId;

    @ApiModelProperty("消息标题")
    private String messageTitle;

    @ApiModelProperty("消息内容")
    private String messageContent;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime createTime;

    @ApiModelProperty("消息状态")
    private Integer messageStatus;
}
