package net._1di.piproserver.controller.api.project.kanban;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.project.kanban.vo.MissionVo;
import net._1di.piproserver.entity.KanbanList;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Project;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IKanbanListService;
import net._1di.piproserver.service.IProjectMissionService;
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
@RequestMapping("/project/mission")
@VerifyToken // 全局都需要验证Token
@Api(tags="项目任务功能")
@Slf4j
public class ProjectMissionController {

    @Autowired
    ResultUtil resultUtil;
    @Autowired
    IKanbanListService kanbanListService;
    @Autowired
    IProjectService projectService;
    @Autowired
    IProjectMissionService projectMissionService;

    @ApiOperation("创建待办任务")
    @PostMapping
    public Result createMission(@RequestAttribute("member")Member member, @Valid @RequestBody MissionVo missionVo){
        // 判断看板是否为空
        KanbanList kanban = kanbanListService.getById(missionVo.getKanbanListId());
        if(ObjectUtils.isEmpty(kanban)) {
            log.info("{} 非法访问 ，看板 {} 不存在",member,missionVo.getKanbanListId());
            return resultUtil.fail("非法访问，看板不存在");
        }
        Project currentProject = projectService.getById(kanban.getProjectId());
        if(ObjectUtils.isEmpty(currentProject)) {
            log.info("{} 非法访问 ，项目 {} 不存在",member,missionVo.getKanbanListId());
            return resultUtil.fail("非法访问，项目不存在");
        }
        // 判断当前用否 在 此项目中
        // 这一套逻辑主要是语义上非常通顺易于理解
        // 我不想说直接拿到看板ID ，就直接判断其项目中有没有这个用户
        if(projectService.isMemberJoinTheProject(member.getMemberId(),currentProject.getProjectId())){
            log.info("[USER => {}] 创建了 一个 任务 [{}]",member,missionVo.getMissionTitle());
            try{
                projectMissionService.createMission(missionVo);
                return resultUtil.success("添加任务成功");
            }catch (Exception e){
                e.printStackTrace();
                return resultUtil.fail("非法数据异常，已记录，请查看日志分析");
            }
        }else {
            log.info("{} 非法访问，正在创建一个不属于自己项目的任务 {}",member,missionVo.getMissionTitle());
            return resultUtil.fail("非法访问，你未参加这个项目");
        }
    }

}
