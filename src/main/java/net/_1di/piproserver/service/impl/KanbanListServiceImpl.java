package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.entity.KanbanList;
import net._1di.piproserver.mapper.KanbanListMapper;
import net._1di.piproserver.service.IKanbanListService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.service.IProjectMembersService;
import net._1di.piproserver.service.IProjectMissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
public class KanbanListServiceImpl extends ServiceImpl<KanbanListMapper, KanbanList> implements IKanbanListService {

    @Autowired
    IProjectMissionService projectMissionService;
    @Autowired
    IProjectMembersService projectMembersService;

    @Override
    public List<KanbanList> getKabanListByProjectId(Integer projectId) {
        List<KanbanList> kanbanList = list(new QueryWrapper<KanbanList>().lambda().eq(KanbanList::getProjectId, projectId));
        kanbanList.forEach(a->{
            // 通过KanbanId获取MissionList
            a.setMissionList(projectMissionService.getMissionsByKanbanId(a.getKanbanListId()));
        });
        return kanbanList;
    }
}
