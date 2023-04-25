package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.controller.api.project.member.dto.AddProjectUserDto;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.ProjectMembers;
import net._1di.piproserver.enums.ProjectMemberStatus;
import net._1di.piproserver.mapper.ProjectMembersMapper;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.service.IMissionMemberService;
import net._1di.piproserver.service.IProjectMembersService;
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
@Slf4j
public class ProjectMembersServiceImpl extends ServiceImpl<ProjectMembersMapper, ProjectMembers> implements IProjectMembersService {

    @Autowired
    IMemberService memberService;

    @Override
    public List<Member> getMemberListNotJoinTheProject(Integer projectId) {
        // 查询当前项目所有的参与成员
        List<ProjectMembers> joinList = this.list(new QueryWrapper<ProjectMembers>().lambda().eq(ProjectMembers::getProjectId, projectId));
        // 查询不在当前项目的所有参与成员
        return memberService.list(new QueryWrapper<Member>().lambda().notIn(Member::getMemberId,joinList.stream().map(a->a.getMemberId()).toArray()));
    }

    @Override
    public boolean isMemberValid(Integer memberId) {
        Member member = memberService.getById(memberId);
        if(ObjectUtils.isEmpty(member) || member.getAuthorityType() < 0) return false;
        return true;
    }

    @Override
    public boolean addUserToProject(Integer memberId, Integer projectId) {
        ProjectMembers realNotExist = getOne(new QueryWrapper<ProjectMembers>().lambda().eq(
                        ProjectMembers::getMemberId,memberId)
                .eq(ProjectMembers::getProjectId, projectId));
        // 如果存在这个用户，就把删除状态改成默认状态
        // 就是有可能被删除过
        if(ObjectUtils.isNotEmpty(realNotExist)) {
            realNotExist.setProjectAuthority(ProjectMemberStatus.DEFAULT);
            return updateById(realNotExist);
        }
        // 创建一个普通成员对象
        ProjectMembers projectMembers = new ProjectMembers(projectId, memberId, ProjectMemberStatus.DEFAULT);
        return save(projectMembers);
    }

    @Override
    public boolean setUserDeleteStatus(AddProjectUserDto addProjectUserDto) {
        ProjectMembers projectMember = getOne(new QueryWrapper<ProjectMembers>().lambda().eq(
                        ProjectMembers::getMemberId,addProjectUserDto.getMemberId())
                .eq(ProjectMembers::getProjectId,addProjectUserDto.getProjectId()));
        if(ObjectUtils.isEmpty(projectMember)){
            log.info("成员 {} 不在 项目 {}中",addProjectUserDto.getMemberId(),addProjectUserDto.getProjectId());
            return false;
        }
        projectMember.setProjectAuthority(ProjectMemberStatus.DELETE);
        projectMember.setUpdateTime(null);
        return update(projectMember,new QueryWrapper<ProjectMembers>().lambda()
                .eq(ProjectMembers::getMemberId,addProjectUserDto.getMemberId())
                .eq(ProjectMembers::getProjectId,addProjectUserDto.getProjectId()));
    }
}
