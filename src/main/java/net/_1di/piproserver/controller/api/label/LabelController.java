package net._1di.piproserver.controller.api.label;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.label.vo.LabelVo;
import net._1di.piproserver.entity.Label;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.ILabelService;
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
@RequestMapping("/project/label")
@VerifyToken
@Slf4j
@Api(tags = "项目标签功能")
public class LabelController {
    @Autowired
    ResultUtil resultUtil;
    @Autowired
    IProjectService projectService;
    @Autowired
    ILabelService labelService;

    /**
     * 带labelId则是更新
     * 不带labelId则是创建
     * @param member
     * @param labelVo
     * @return
     */
    @ApiOperation("创建任务标签")
    @PostMapping
    public Result createLabel(@RequestAttribute("member") Member member, @RequestBody @Valid LabelVo labelVo){
        if(ObjectUtils.isEmpty(projectService.getById(labelVo.getProjectId())))
        {
            log.info("[USER => {}] 非法创建 Label {} ",member.getMemberName(),labelVo.getLabelName());
            return resultUtil.fail("非法访问，项目不存在");
        }
        // 这里用了取反，判断是如果在此项目 则为 false,如果不在则为true 为非法创建
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),labelVo.getProjectId()))
            return resultUtil.fail("非法创建，你未参加该项目");

        // 判断是否为创建还是更新
        if(ObjectUtils.isEmpty(labelVo.getLabelId())){
            labelService.save(new Label(
                    labelVo.getProjectId(),
                    labelVo.getLabelName(),
                    labelVo.getLabelColor()
            ));
            return resultUtil.success("标签创建成功");
        }else {
            Label label = labelService.getById(labelVo.getLabelId());
            // label 必须 存在， 查到的label 的项目id 与 提交的ID必须一致
            if(ObjectUtils.isNotEmpty(label) && label.getProjectId() == labelVo.getProjectId()) {
                labelService.updateById(new Label(
                        labelVo.getLabelName(),
                        labelVo.getLabelColor(),
                        labelVo.getLabelId()
                ));
                return resultUtil.success("标签编辑成功");
            } else
                return resultUtil.fail("非法修改，修改的标签不存在");
        }
    }

    @ApiOperation("标签删除")
    @DeleteMapping("/{id}")
    public Result deleteLabel(@RequestAttribute("member")Member member,@PathVariable("id") Integer id){
        Label label = labelService.getById(id);
        // 判断标签是否存在
        if(ObjectUtils.isEmpty(label)){
            log.warn("[USER=>{}] 删除 [{}] 标签不存在",member.getMemberName(),id);
            return resultUtil.fail("标签不存在");
        }
        // 判断用户是不是本标签的项目的用户
        if(projectService.isMemberJoinTheProject(member.getMemberId(),label.getProjectId())){
            log.info("[USER=>{}] 删除 [{}]标签",member.getMemberName(),label.getLabelName());
            labelService.removeById(id);
            return resultUtil.success("标签删除成功");
        }else {
            log.warn("[USER=>{}] 删除 正在尝试删除 项目[{}]的[{}]标签",member.getMemberName(),label.getProjectId(),label.getLabelName());
            return resultUtil.fail("你正在执行非法操作，非法删除其他项目标签");
        }
    }

}
