package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.project.project.dto.MissionTodayAndLastDto;
import net._1di.piproserver.controller.api.project.project.dto.ProjectMissionDto;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Project;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.entity.ProjectMission;
import net._1di.piproserver.enums.MissionOrder;
import net._1di.piproserver.pojo.MissionV2;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IProjectService extends IService<Project> {


    public boolean saveProject(Project project,Integer memberId);
    public List<Project> getProjectById(Integer memberId);

    /**
     * 判断 memberId 是否 在该项目 中
     * @param memberId
     * @param projectId
     * @return
     */
    public boolean isMemberJoinTheProject(Integer memberId,Integer projectId);

    /**
     * 获取项目详情
     * @param projectId
     * @return
     */
    Project getProjectDetail(Integer projectId);

    /**
     * 通member获取用户列表
     * @param member
     * @return
     */
    MissionTodayAndLastDto getMissionListByMember(Member member,Integer project);


    /**
     * 获取member下的所有mission
     * @param member
     * @param project
     * @return
     */
    List<String> getMemberAllMissionFromProject(Member member,Integer project);

    /**
     * 获取此用户所有的任务
     * @param member
     * @return
     */
    List<MissionV2> getAllMissionOfMember(Member member) ;
}

