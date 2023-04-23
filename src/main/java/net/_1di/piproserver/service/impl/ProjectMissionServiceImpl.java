package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.entity.KanbanList;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.MissionMember;
import net._1di.piproserver.entity.ProjectMission;
import net._1di.piproserver.mapper.ProjectMissionMapper;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.service.IMissionMemberService;
import net._1di.piproserver.service.IProjectMissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.ObjectUtils;
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
public class ProjectMissionServiceImpl extends ServiceImpl<ProjectMissionMapper, ProjectMission> implements IProjectMissionService {

    @Autowired
    IMemberService memberService;

    @Autowired
    IMissionMemberService missionMemberService;

    @Override
    public List<ProjectMission> getMissionsByKanbanId(Integer kanbanId) {
        List<ProjectMission> missionList = list(new QueryWrapper<ProjectMission>()
                .lambda()
                .eq(ProjectMission::getKanbanListId, kanbanId));

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

            });
        }

        return missionList;
    }
}
