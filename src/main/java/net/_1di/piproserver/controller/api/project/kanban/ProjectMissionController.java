package net._1di.piproserver.controller.api.project.kanban;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.project.kanban.vo.KanbanChangeVo;
import net._1di.piproserver.controller.api.project.kanban.vo.MissionVo;
import net._1di.piproserver.entity.KanbanList;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Project;
import net._1di.piproserver.entity.ProjectMission;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IKanbanListService;
import net._1di.piproserver.service.IProjectMissionService;
import net._1di.piproserver.service.IProjectService;
import net._1di.piproserver.utils.OperationLogUtil;
import net._1di.piproserver.utils.ResultUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    OperationLogUtil logUtil;

    @ApiOperation("创建待办任务")
    @PostMapping
    public Result createMission(@RequestAttribute("member") Member member, @Valid @RequestBody MissionVo missionVo) {
        // 判断看板是否为空
        KanbanList kanban = kanbanListService.getById(missionVo.getKanbanListId());
        if (ObjectUtils.isEmpty(kanban)) {
            log.info("{} 非法访问 ，看板 {} 不存在", member.getMemberName(), missionVo.getKanbanListId());
            return resultUtil.fail("非法访问，看板不存在");
        }
        Project currentProject = projectService.getById(kanban.getProjectId());
        if(ObjectUtils.isEmpty(currentProject)) {
            log.info("{} 非法访问 ，项目 {} 不存在", member.getMemberName(), missionVo.getKanbanListId());
            return resultUtil.fail("非法访问，项目不存在");
        }
        // 判断当前用否 在 此项目中
        // 这一套逻辑主要是语义上非常通顺易于理解
        // 我不想说直接拿到看板ID ，就直接判断其项目中有没有这个用户
        if(projectService.isMemberJoinTheProject(member.getMemberId(),currentProject.getProjectId())){
            log.info("[USER => {}] 创建了 一个 任务 [{}]", member.getMemberName(), missionVo.getMissionTitle());
            try{
                // 更新
                if(StringUtils.isNotEmpty(missionVo.getMissionId())){
                    return projectMissionService.updateMission(missionVo);
                }else {
                    // 创建
                    projectMissionService.createMission(missionVo);
                    return resultUtil.success("添加任务成功");
                }
            } catch (Exception e) {
                e.printStackTrace();
                return resultUtil.fail("非法数据异常，已记录，请查看日志分析");
            }
        } else {
            log.info("{} 非法访问，正在创建一个不属于自己项目的任务 {}", member.getMemberName(), missionVo.getMissionTitle());
            return resultUtil.fail("非法访问，你未参加这个项目");
        }
    }

    /**
     * 后期修改 排序，什么的都可以用这个写。
     * @param member
     * @param changeVo
     * @return
     */
    @ApiOperation("修改任务的面板")
    @PostMapping("change")
    public Result changekanban(@RequestAttribute("member") Member member, @RequestBody @Valid KanbanChangeVo changeVo) {
        // 判断任务是否存在
        ProjectMission currentMission = projectMissionService.getById(changeVo.getMissionId());
        if (ObjectUtils.isEmpty(currentMission)) {
            log.info("{} 非法访问 ，任务 {} 不存在", member.getMemberName(), changeVo.getMissionId());
            return resultUtil.fail(String.format("非法操作，任务 %s 不存在 ", changeVo.getMissionId()));
        }
        // 判断 修改到的看板是否存在
        KanbanList toKanban = kanbanListService.getById(changeVo.getToKanbanId());
        if (ObjectUtils.isEmpty(toKanban)) {
            log.info("{} 非法访问 ，看板 {} 不存在", member.getMemberName(), changeVo.getToKanbanId());
            return resultUtil.fail(String.format("非法操作，看板 %s 不存在 ", changeVo.getToKanbanId()));
        }
        // 判断任务看板是否与此项目在同一项目
        // 主要是通过这个看板拿到项目ID
        KanbanList currentKanbanId = kanbanListService.getById(currentMission.getKanbanListId());
        // 判断用户是否在此项目
        if (!projectService.isMemberJoinTheProject(member.getMemberId(), currentKanbanId.getProjectId())) {
            log.info("{} 非法操作,你不属于 项目 {}", member.getMemberName(), currentKanbanId.getProjectId());
            return resultUtil.fail(String.format("非法操作，你不属于 本项目 %s ", currentKanbanId.getProjectId()));
        }
        // 判断两个看板是否在同一个项目
        if (toKanban.getProjectId() != currentKanbanId.getProjectId()) {
            log.info("{} 非法操作,看板 {} 与 看板 {} 不属于同一项目 {}"
                    , member.getMemberName()
                    , toKanban.getKanbanListId()
                    , currentKanbanId.getKanbanListId()
                    , toKanban.getProjectId()
            );
            return resultUtil.fail(String.format("非法操作，看板 %s 与 看板 %s 不属于同一项目 ",
                    toKanban.getListName(),
                    currentKanbanId.getListName()));
        }
        // 修改任务的看板
        currentMission.setKanbanListId(changeVo.getToKanbanId());
        currentMission.setUpdateTime(null);
        projectMissionService.updateById(currentMission);
        return resultUtil.success("修改看板成功");
    }

}
