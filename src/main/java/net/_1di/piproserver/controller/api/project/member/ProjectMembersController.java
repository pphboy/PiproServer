package net._1di.piproserver.controller.api.project.member;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.project.member.dto.AddProjectUserDto;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Project;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IProjectMembersService;
import net._1di.piproserver.service.IProjectService;
import net._1di.piproserver.utils.ResultUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import javax.validation.Valid;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@RestController
@RequestMapping("/project/member")
@VerifyToken
@Api(tags = "成员面板")
@Slf4j
public class ProjectMembersController {

    @Autowired
    IProjectMembersService projectMembersService;

    @Autowired
    IProjectService projectService;

    @Autowired
    ResultUtil resultUtil;
    @GetMapping("/{id}")
    @ApiOperation("获取全局所有不在本项目的成员")
    public Result getAllMemberThatNotJoinCurrentProject(@RequestAttribute("member")Member member, @PathVariable("id")Integer projectId){
        if(projectService.isMemberJoinTheProject(member.getMemberId(),projectId)){
            return resultUtil.success("获取不在当前列表中用户接口成功",projectMembersService.getMemberListNotJoinTheProject(projectId));
        }else{
            log.info("[USER=>{}] 非法获取未加入本[id={}]项目的全部用户权限",member.getMemberName(),projectId);
            return resultUtil.fail("你不在此项目中，此操作是非法的，已记录");
        }
    }

    @PostMapping
    @ApiOperation("添加为项目添加成员")
    public Result addUserToProject(@RequestAttribute("member")Member member,@RequestBody @Valid AddProjectUserDto addProjectUserDto){
        Project project = projectService.getById(addProjectUserDto.getProjectId());
        if(ObjectUtils.isEmpty(project)){
            log.info("USER{{}} 添加的用户 {} 不合法，项目不存在 {}",member.getMemberName(),addProjectUserDto.getMemberId(),addProjectUserDto.getProjectId());
            return resultUtil.fail("非法操作，项目不存在");
        }
        // 判断操作者是否在当前项目
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),addProjectUserDto.getProjectId())){
            log.info("USER{} {} 非法操作，未参与该项目 {}",member.getMemberName(),member.getMemberId(),addProjectUserDto.getProjectId());
            return resultUtil.fail("非法操作，未参与该项目");
        }
        if(!projectMembersService.isMemberValid(addProjectUserDto.getMemberId())){
            log.info("USER{{}} 添加的用户 {} 不合法 ",member.getMemberName(),addProjectUserDto.getMemberId());
            return resultUtil.fail("添加的MemberId用户不合法");
        }
        if(projectMembersService.addUserToProject(addProjectUserDto.getMemberId(),addProjectUserDto.getProjectId())){
            return  resultUtil.success("添加成功");
        }else {
            return  resultUtil.fail("添加失败，用户已在此项目，如果不在请查看日志");
        }
    }

    /**
     * 其实应时把状态设置 DELETE
     * @param member
     * @param addProjectUserDto
     * @return
     */
    @PostMapping("/delete")
    // 目前是加了这个权限
    @VerifyPermission("DEFAULT")
    @ApiOperation("删除该项目的成员")
    public Result deleteMemberFromProject(@RequestAttribute("member")Member member,@RequestBody @Valid AddProjectUserDto addProjectUserDto){
        if(member.getMemberId() == addProjectUserDto.getMemberId()){
            log.info("USER{{}} 删除的用户 {} 不合法，不能删除自己",member.getMemberName(),addProjectUserDto.getMemberId());
            return resultUtil.fail("非法操作，不能删除自己，你是管理员");
        }
        Project project = projectService.getById(addProjectUserDto.getProjectId());
        if(ObjectUtils.isEmpty(project)){
            log.info("USER{{}} 删除的用户 {} 不合法，项目不存在 {}",member.getMemberName(),addProjectUserDto.getMemberId(),addProjectUserDto.getProjectId());
            return resultUtil.fail("非法操作，项目不存在");
        }
        // 判断操作者是否在当前项目
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),addProjectUserDto.getProjectId())){
            log.info("USER{} {} 非法操作，未参与该项目 {}",member.getMemberName(),member.getMemberId(),addProjectUserDto.getProjectId());
            return resultUtil.fail("非法操作，未参与该项目");
        }
        // 判断删除的用户在不在此项目中
        if(!projectService.isMemberJoinTheProject(addProjectUserDto.getMemberId(),addProjectUserDto.getProjectId())){
            log.info("USER{} {} 非法操作， {} 未参与该项目 {}",member.getMemberName(),member.getMemberId(),addProjectUserDto.getMemberId(),addProjectUserDto.getProjectId());
            return resultUtil.fail(String.format("非法操作，%d 成员未在本项目中",addProjectUserDto.getMemberId()));
        }
        if(!projectMembersService.isMemberValid(addProjectUserDto.getMemberId())){
            log.info("USER{{}} 添加的用户 {} 不合法 ",member.getMemberName(),addProjectUserDto.getMemberId());
            return resultUtil.fail("删除的MemberId用户不合法");
        }
        if(projectMembersService.setUserDeleteStatus(addProjectUserDto)){
            return  resultUtil.success("踢除用户成功");
        }else {
            return  resultUtil.success("踢除成员失败，如果有问题，请查看日志");
        }

    }

}
