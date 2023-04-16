package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 看板列表
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Getter
@Setter
@TableName("pi_kanban_list")
public class KanbanList implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 列表标识
     */
    private Integer kanbanListId;

    /**
     * 项目标识
     */
    private Integer projectId;

    /**
     * 列表名
     */
    private String listName;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}
