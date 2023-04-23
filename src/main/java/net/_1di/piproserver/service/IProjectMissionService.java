package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.project.kanban.vo.MissionVo;
import net._1di.piproserver.entity.ProjectMission;
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
public interface IProjectMissionService extends IService<ProjectMission> {

    /**
     * 通过看板ID获取任务列表，这个列表包含了完成的任务的信息
     * @param kanbanId
     * @return
     */
    public List<ProjectMission> getMissionsByKanbanId(Integer kanbanId);

    /**
     * 创建一个项目
     * @param missionVo
     */
    boolean createMission(MissionVo missionVo);

    Result updateMission(MissionVo missionVo);
}
