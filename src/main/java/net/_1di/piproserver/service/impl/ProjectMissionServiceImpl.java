package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.controller.api.project.kanban.vo.MissionVo;
import net._1di.piproserver.entity.*;
import net._1di.piproserver.mapper.ProjectMissionMapper;
import net._1di.piproserver.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.ObjectUtils;
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
@Slf4j
@Service
public class ProjectMissionServiceImpl extends ServiceImpl<ProjectMissionMapper, ProjectMission> implements IProjectMissionService {

    @Autowired
    IMemberService memberService;

    @Autowired
    IMissionMemberService missionMemberService;

    @Autowired
    ILabelService labelService;

    @Autowired
    IProjectMissionRelaLabelService projectMissionRelaLabelService;

    @Override
    public List<ProjectMission> getMissionsByKanbanId(Integer kanbanId) {
        List<ProjectMission> missionList = list(new QueryWrapper<ProjectMission>()
                .lambda()
                .eq(ProjectMission::getKanbanListId, kanbanId)
                .orderByDesc(ProjectMission::getUpdateTime));

        // 如果不为空，则设置用户信息
        if(ObjectUtils.isNotEmpty(missionList)){
            missionList.forEach(a->{
                // 根据任务的ID查询用户的ID数组
                List<MissionMember> missionMembers = missionMemberService.list(new QueryWrapper<MissionMember>().lambda()
                        .eq(MissionMember::getMissionId, a.getMissionId()));
                // mission查出来也是个空的数组，所以不用担心为null
                if(ObjectUtils.isNotEmpty(missionMembers)){
                    List<Member> memberList = memberService.list(new QueryWrapper<Member>().lambda()
                            .in(Member::getMemberId,
                                    missionMembers.stream().map(b -> b.getMemberId()).toArray())
                    );
                    a.setMemberList(memberList);
                }
                // 查询Label数据
                List<ProjectMissionRelaLabel> relaList = projectMissionRelaLabelService.list(new QueryWrapper<ProjectMissionRelaLabel>().lambda()
                        .eq(ProjectMissionRelaLabel::getMissionId, a.getMissionId()));
                // 如果有Label则把Label查出来
                if(ObjectUtils.isNotEmpty(relaList)){
                    List<Label> labelList = labelService.list(new QueryWrapper<Label>().lambda().in(Label::getLabelId
                            , relaList.stream().map(c -> c.getLabelId()).toArray()
                    ));
                    a.setLabelList(labelList);
                }
            });
        }
        return missionList;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean createMission(MissionVo missionVo) {
        ProjectMission projectMission = new ProjectMission();
        projectMission.setMissionTitle(missionVo.getMissionTitle());
        projectMission.setMissionIntro(missionVo.getMissionIntro());
        projectMission.setStartTime(missionVo.getStartTime());
        projectMission.setEndTime(missionVo.getEndTime());
        projectMission.setKanbanListId(missionVo.getKanbanListId());

        // 保存任务
        save(projectMission);

        // 添加 标签
        for(Integer labelId: missionVo.getLabelList()){
            Label tempLabel = labelService.getById(labelId);
            if(ObjectUtils.isEmpty(tempLabel)) {
                log.info("{} 标签不存在",labelId);
                throw new RuntimeException("标签不存在");
            }
            // 保存
            projectMissionRelaLabelService.save(new ProjectMissionRelaLabel(labelId,projectMission.getMissionId()));
        }

        // 添加 用户
        for (Integer memberId : missionVo.getMemberList()){
            Member tempMember = memberService.getById(memberId);
            if(ObjectUtils.isEmpty(tempMember)) {
                log.info("{} 用户不存在",memberId);
                throw new RuntimeException("用户不存在");
            }
            // 保存
            missionMemberService.save(new MissionMember(projectMission.getMissionId(), memberId));
        }

        return true;
    }
}
