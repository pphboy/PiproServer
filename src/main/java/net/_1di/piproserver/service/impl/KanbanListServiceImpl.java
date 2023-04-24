package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.entity.KanbanList;
import net._1di.piproserver.entity.ProjectMission;
import net._1di.piproserver.enums.KanbanStatus;
import net._1di.piproserver.enums.MissionStatus;
import net._1di.piproserver.mapper.KanbanListMapper;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IKanbanListService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.service.IProjectMembersService;
import net._1di.piproserver.service.IProjectMissionService;
import net._1di.piproserver.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    ResultUtil resultUtil;

    @Override
    public List<KanbanList> getKabanListByProjectId(Integer projectId) {
        List<KanbanList> kanbanList = list(new QueryWrapper<KanbanList>().lambda()
                .eq(KanbanList::getProjectId, projectId)
                // 已删除的项目不能要
                .ne(KanbanList::getKanbanStatus, KanbanStatus.DELETE));

        kanbanList.forEach(a->{
            // 通过KanbanId获取MissionList
            a.setMissionList(projectMissionService.getMissionsByKanbanId(a.getKanbanListId()));
        });
        return kanbanList;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteKanbanById(KanbanList kanbanList) {
        try{
            kanbanList.setKanbanStatus(KanbanStatus.DELETE);
            updateById(kanbanList);
            ProjectMission projectMission = new ProjectMission().setMissionStatus(MissionStatus.DELETE);
            projectMissionService.update(projectMission,
                    new QueryWrapper<ProjectMission>().lambda().eq(ProjectMission::getKanbanListId,kanbanList.getKanbanListId()));
            return resultUtil.success("删除看板成功");
        }catch (Exception e){
            e.printStackTrace();
            return resultUtil.fail("删除看板失败，请重试");
        }
    }
}
