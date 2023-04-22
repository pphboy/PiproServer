package net._1di.piproserver.controller.api.project;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.project.vo.ProjectVo;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.Project;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.service.IProjectService;
import net._1di.piproserver.utils.RedisUtil;
import net._1di.piproserver.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Api(tags = "项目功能")
@RestController
@RequestMapping("/project")
@Slf4j
public class ProjectController {

    @Autowired
    ResultUtil resultUtil;
    @Autowired
    RedisUtil redisUtil;
    @Autowired
    IProjectService projectService;
    @Autowired
    IMemberService memberService;


    @VerifyToken
    @ApiOperation("获取当前用户所有项目 VerifyToken")
    @PostMapping("list")
    public Result getAllProject(@RequestAttribute("member")Member member){
        return resultUtil.success("成功",projectService.getProjectById(member.getMemberId()));
    }

    @VerifyPermission("DEFAULT")
    @ApiOperation("获取当前用户所有项目")
    @PostMapping("create")
    public Result createProject(@RequestAttribute("member")Member member,
                                @RequestBody ProjectVo projectVo){
        projectService.saveProject(
                new Project(projectVo.getProjectName(),projectVo.getProjectIntro(),100)
                ,member.getMemberId());

        return resultUtil.success("添加项目成功");
    }

}
