package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.controller.api.project.project.dto.MissionTodayAndLastDto;
import net._1di.piproserver.controller.api.project.project.dto.ProjectMissionDto;
import net._1di.piproserver.entity.*;
import net._1di.piproserver.enums.KanbanStatus;
import net._1di.piproserver.enums.MissionOrder;
import net._1di.piproserver.enums.MissionStatus;
import net._1di.piproserver.enums.ProjectMemberStatus;
import net._1di.piproserver.mapper.ProjectMapper;
import net._1di.piproserver.mapper.ProjectMissionMapper;
import net._1di.piproserver.pojo.MissionV2;
import net._1di.piproserver.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
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
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements IProjectService {


    @Autowired
    IProjectMissionService projectMissionService;

    @Autowired
    IProjectMembersService projectMembersService;

    @Autowired
    IKanbanListService kanbanListService;

    @Autowired
    ILabelService labelService;

    @Autowired
    IMemberService memberService;

    @Autowired
    IMissionMemberService missionMemberService;

    @Autowired
    ProjectMissionMapper projectMissionMapper;

    @Override
    @Transactional
    public boolean saveProject(Project project, Integer memberId) {
        save(project);
        ProjectMembers creator=  new ProjectMembers(project.getProjectId(),memberId,100);
        return projectMembersService.save(creator);
    }

    @Override
    public List<Project> getProjectById(Integer memberId) {
        List<ProjectMembers> memberList = projectMembersService.list(new QueryWrapper<ProjectMembers>().lambda()
                .eq(ProjectMembers::getMemberId, memberId));
        // 如果为空，直接返回null 即可
        if(ObjectUtils.isEmpty(memberList)) return null;


        List<Project> projectList = list(new QueryWrapper<Project>().lambda().in(Project::getProjectId,
                memberList.stream().map(a -> a.getProjectId()).toArray()        // 这个相当于是直接把memberList里的list做成 项目ID集合 类似于 {1,2,3,5}
        ));
        return projectList;
    }

    @Override
    public boolean isMemberJoinTheProject(Integer memberId, Integer projectId) {
        ProjectMembers projectMember = projectMembersService.getOne(new QueryWrapper<ProjectMembers>().lambda()
                .eq(ProjectMembers::getMemberId, memberId)
                .eq(ProjectMembers::getProjectId, projectId));

        if(ObjectUtils.isNotEmpty(projectMember))
            if(projectMember.getProjectAuthority() >= 0) return true;
        return false;
    }

    @Override
    public Project getProjectDetail(Integer projectId) {
        Project project = getById(projectId);
        // 看板列表
        project.setKanbanList(kanbanListService.getKabanListByProjectId(projectId));
        // 标签列表
        project.setLabelList(labelService.getLabelListByProjectId(projectId));
        // 用户列表
        project.setMemberList(memberService.getMembersByProjectId(projectId));
        return project;
    }

    @Override
    public MissionTodayAndLastDto getMissionListByMember(Member member,Integer projectId) {
        // 拿到项目所有的任务ID
        List<String> allMission = this.getMemberAllMissionFromProject(member, projectId);
        if(ObjectUtils.isEmpty(allMission)) return null;

        // 拿到 所有 任务中属于Member的所有任务
        List<MissionMember> missionMemberList= missionMemberService.list(
                new QueryWrapper<MissionMember>().lambda()
                        .eq(MissionMember::getMemberId, member.getMemberId())
                        .in(MissionMember::getMissionId,allMission)
        );

        if(ObjectUtils.isEmpty(missionMemberList)) return null;

        MissionTodayAndLastDto missionTodayAndLastDto = new MissionTodayAndLastDto();
//
        // endTime大于今天，就是今日待办
        missionTodayAndLastDto.setToday(
                projectMissionService.list(new QueryWrapper<ProjectMission>().lambda()
                .in(ProjectMission::getMissionId,missionMemberList.stream().map(a->a.getMissionId()).toArray())
                // 项目状态必须为0
                .eq(ProjectMission::getMissionStatus, MissionStatus.DEFAULT)
                .gt(ProjectMission::getEndTime, LocalDateTime.now())
        ));
        // 查询Member放到任务里
        if(ObjectUtils.isNotEmpty(missionTodayAndLastDto.getToday())){
            missionTodayAndLastDto.getToday().forEach(a->{
                a.setMemberList(memberService.getMembersByMissionId(a.getMissionId()));
            });
        }

        // endTime小于今天 逾期
        missionTodayAndLastDto.setOvertime(
                projectMissionService.list(new QueryWrapper<ProjectMission>().lambda()
                .in(ProjectMission::getMissionId,missionMemberList.stream().map(a->a.getMissionId()).toArray())
                // 项目状态必须为0
                .eq(ProjectMission::getMissionStatus, MissionStatus.DEFAULT)
                .le(ProjectMission::getEndTime, LocalDateTime.now())
        ));
        // 查询Member放到任务里
        if(ObjectUtils.isNotEmpty(missionTodayAndLastDto.getOvertime())){
            missionTodayAndLastDto.getOvertime().forEach(a->{
                a.setMemberList(memberService.getMembersByMissionId(a.getMissionId()));
            });
        }

        return missionTodayAndLastDto;
    }

    @Override
    public List<String> getMemberAllMissionFromProject(Member member, Integer project) {
        // 查询所有默认的看板列表
        List<KanbanList> kanbanList = kanbanListService.list(new QueryWrapper<KanbanList>().lambda()
                .eq(KanbanList::getProjectId, project).eq(KanbanList::getKanbanStatus, KanbanStatus.DEFAULT));
        if(ObjectUtils.isEmpty(kanbanList)) return null;

        // 拿到Kanban的ID，并拿到对应的所有的任务
        List<ProjectMission> missionList= projectMissionService.list(new QueryWrapper<ProjectMission>().lambda()
                .in(ProjectMission::getKanbanListId, kanbanList.stream().map(a -> a.getKanbanListId()).toArray()));

        if(ObjectUtils.isEmpty(missionList)) return null;
        List<String> missionIds = new ArrayList<>();
        missionList.forEach(a->missionIds.add(a.getMissionId()));
        return missionIds;
    }

    /**
     * 在所有看板下所有任务里找到自己的任务
     * 相接查中间表就可以了
     * @param member
     * @return
     */
    @Override
    public List<MissionV2> getAllMissionOfMember(Member member) {
        List<MissionV2> missionList = projectMissionMapper.getMissionsByMemberId(member.getMemberId());
        projectMissionService.setMissionV2DetailInfo(missionList);
        return missionList;
    }

    /**
     * 这是自定义的一个扩展，如果后面需要设置一些操作时，可以用这个在前端就传值过来，然后直接设置其排序方式就可以了
     * @param lambdaQueryWrapper
     * @param sort
     * @return
     */
    private void setMemberSortStatus(
            LambdaQueryWrapper<ProjectMission> lambdaQueryWrapper, MissionOrder sort){
        switch (sort)
        {
            case MISSION_ORDER:
                lambdaQueryWrapper.orderByDesc(ProjectMission::getMissionOrder);
                break;
            case UPDATE_TIME:
                lambdaQueryWrapper.orderByDesc(ProjectMission::getUpdateTime);
                break;
            case CREATE_TIME:
                lambdaQueryWrapper.orderByDesc(ProjectMission::getCreateTime);
                break;
        }
    }

}
