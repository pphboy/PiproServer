package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.project.member.dto.AddProjectUserDto;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.ProjectMembers;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IProjectMembersService extends IService<ProjectMembers> {

    /**
     * 获取没有加入项目的所有其他成员
     * @param projectId
     * @return
     */
    List<Member> getMemberListNotJoinTheProject(Integer projectId);

    /**
     * 判断用户是否有效
     * @param memberId
     * @return
     */
    boolean isMemberValid(Integer memberId);

    /**
     * 添加一个用户到项目中
     * 不要抽错了位置
     * @param memberId
     * @param projectId
     * @return
     */
    boolean addUserToProject(Integer memberId,Integer projectId);

    /**
     * 设置 成员的删除状态
     * @param addProjectUserDto
     * @return
     */
    boolean setUserDeleteStatus(AddProjectUserDto addProjectUserDto);

}
