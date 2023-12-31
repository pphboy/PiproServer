package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.project.kanban.vo.MissionVo;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.ProjectMission;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.pojo.MissionV2;
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
     * 设置任务详情
     * @param missionList
     */
    public void setMissionDetailInfo(List<ProjectMission> missionList);

    /**
     * 通过看板ID获取任务列表，这个列表包含了完成的任务的信息
     * @param kanbanId
     * @return
     */
    public List<ProjectMission> getMissionsByKanbanId(Integer kanbanId);

    public List<ProjectMission> getMissionsByKanbanIdAndMemberId(Integer kanbanId, Member member);

    /**
     * 创建一个项目
     * @param missionVo
     */
    boolean createMission(MissionVo missionVo);

    Result updateMission(MissionVo missionVo);

    /**
     * 为MissionV2设置状态
     * @param missionList
     */
    void setMissionV2DetailInfo(List<MissionV2> missionList);
}
