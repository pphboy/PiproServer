package net._1di.piproserver.controller.api.project.kanban;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.project.kanban.vo.KanbanCreateVo;
import net._1di.piproserver.controller.api.project.kanban.vo.KanbanUpdateVo;
import net._1di.piproserver.entity.KanbanList;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Project;
import net._1di.piproserver.enums.KanbanStatus;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IKanbanListService;
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
@VerifyToken // 这里加了Token验证
@RequestMapping("/project/kanban")
@Slf4j
@Api(tags = "看板功能")
public class KanbanListController {

    @Autowired
    IKanbanListService kanbanListService;
    @Autowired
    IProjectService projectService;

    @Autowired
    ResultUtil resultUtil;
    @ApiOperation("管理员接口，只有管理默认管理才可以使用此接口")
    @PutMapping
    public Result createKanban(@RequestAttribute("member") Member member, @RequestBody @Valid KanbanCreateVo kanbanCreateVo){
        // 判断看板所在的项目是否为空
        Project currentProject = projectService.getById(kanbanCreateVo.getProjectId());
        if(ObjectUtils.isEmpty(currentProject)) {
            log.info("{} 非法访问 ，项目 {} 不存在", member.getMemberName(),kanbanCreateVo.getProjectId());
            return resultUtil.fail("非法访问，项目不存在");
        }
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),currentProject.getProjectId())){
            log.info("{} 非法访问，正在创建一个不属于自己项目的看板 {}", member.getMemberName(), kanbanCreateVo.getKanbanName());
            return resultUtil.fail("非法访问，你未参加这个项目");
        }
        // 这里看板有默认状态为0
        if(kanbanListService.save(new KanbanList(kanbanCreateVo.getProjectId(),kanbanCreateVo.getKanbanName()))){
            return resultUtil.success(String.format("[%s] 创建面板成功",kanbanCreateVo.getKanbanName()));
        }else
            return resultUtil.fail("创建面板失败");
    }

    /**
     * 这个任务需要被 权限验证，目前是所有人都可以删除，但需要权限验证，等我后面有时间再做
     * @param member
     * @return
     */
    @ApiOperation("删除看板")
    @DeleteMapping("/{kanbanId}")
    public Result deleteKanban(@RequestAttribute("member") Member member,@PathVariable("kanbanId")Integer kanbanId){
        // 判断看板是否为空
        KanbanList kanban = kanbanListService.getById(kanbanId);

        // 没办法，这一堆判断没有太多的通用性，每个接口的属性是不一样的
        if (ObjectUtils.isEmpty(kanban) || kanban.getKanbanStatus() == -1) {
            log.info("{} 非法访问 ，看板 {} 不存在", member.getMemberName(),kanban);
            return resultUtil.fail("非法访问，看板不存在");
        }
        Project currentProject = projectService.getById(kanban.getProjectId());
        if(ObjectUtils.isEmpty(currentProject)) {
            log.info("{} 非法访问 ，项目 {} 不存在", member.getMemberName(), kanbanId);
            return resultUtil.fail("非法访问，项目不存在");
        }
        // 判断项目用户是否在该项目中
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),currentProject.getProjectId())){
            log.info("{} 非法访问，正在删除一个不属于自己项目的看板 {}", member.getMemberName(), kanbanId);
            return resultUtil.fail("非法访问，你未参加这个项目");
        }

        // -1 就是删除
        kanban.setKanbanStatus(KanbanStatus.DELETE);
        kanbanListService.updateById(kanban);
        return resultUtil.success("删除看板成功");
    }

    @ApiOperation("更新看板名称")
    @PostMapping
    public Result updateKanban(@RequestAttribute("member") Member member, @RequestBody @Valid KanbanUpdateVo kanbanUpdateVo){
        // 判断看板是否为空
        KanbanList kanban = kanbanListService.getById(kanbanUpdateVo.getKanbanId());
        // 下一个再更新，我已经想到好办法了，这个接口可能要烂在这里了，但下一个接口会我用一些方法取消这种冗余
        if (ObjectUtils.isEmpty(kanban) || kanban.getKanbanStatus() == -1) {
            log.info("{} 非法访问 ，看板 {} 不存在", member.getMemberName(),kanban);
            return resultUtil.fail("非法访问，看板不存在");
        }
        Project currentProject = projectService.getById(kanban.getProjectId());
        if(ObjectUtils.isEmpty(currentProject)) {
            log.info("{} 非法访问 ，项目 {} 不存在", member.getMemberName(), kanbanUpdateVo.getKanbanId());
            return resultUtil.fail("非法访问，项目不存在");
        }
        // 判断项目用户是否在该项目中
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),currentProject.getProjectId())){
            log.info("{} 非法访问，正在更新一个不属于自己项目的看板 {}", member.getMemberName(),kanban.getKanbanListId());
            return resultUtil.fail("非法访问，你未参加这个项目");
        }

        kanban.setListName(kanbanUpdateVo.getKanbanName());
        kanbanListService.updateById(kanban);
        return resultUtil.success(String.format("更新看板 [%s] 成功",kanban.getListName()));
    }

}
