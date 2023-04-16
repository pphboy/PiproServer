package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
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
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 消息标识
     */
    private String messageId;

    /**
     * 信息接收者
     */
    private Integer messageRecieverMemberId;

    /**
     * 信息创建得
     */
    private Integer messageMakerMemberId;

    /**
     * 已读状态
     */
    private Short isRead;

    /**
     * 消息内容
     */
    private String messageContent;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 删除状态
     */
    private Short isDelete;
}
