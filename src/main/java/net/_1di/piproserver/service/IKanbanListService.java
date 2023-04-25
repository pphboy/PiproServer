package net._1di.piproserver.service;

import net._1di.piproserver.entity.KanbanList;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.pojo.Result;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IKanbanListService extends IService<KanbanList> {

    public List<KanbanList> getKabanListByProjectId(Integer projectId);


    /**
     * 删除看板下所有任务和看板，即设置为-1的状态
     * @param kanbanList
     * @return
     */
    public Result deleteKanbanById(KanbanList kanbanList);

}
