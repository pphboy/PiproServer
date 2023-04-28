package net._1di.piproserver.controller.api.document;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.file.vo.DeleteDirectoryVo;
import net._1di.piproserver.controller.api.file.vo.DirectoryVo;
import net._1di.piproserver.controller.api.file.vo.RenameDirectoryVo;
import net._1di.piproserver.entity.DocumentDirectory;
import net._1di.piproserver.entity.FileDirectory;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IDocumentDirectoryService;
import net._1di.piproserver.service.IFileDirectoryService;
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
@Api(tags = "文档目录接口")
@VerifyToken
@Slf4j
@RequestMapping("/project/document/directory")
public class DocumentDirectoryController {

    @Autowired
    IDocumentDirectoryService documentDirectoryService;
    @Autowired
    ResultUtil resultUtil;
    @Autowired
    IProjectService projectService;

    @GetMapping("/{id}")
    @ApiOperation("获取当前项目的所有文档文档列表夹")
    public Result getProjectDocumentList(@RequestAttribute("member") Member member, @PathVariable("id")Integer projectId){
        if(projectService.isMemberJoinTheProject(member.getMemberId(),projectId)){
            return resultUtil.success("获取文档目录成功",
                    documentDirectoryService.getCacheDocumentDirectoriesByProjectId(projectId));
        }else {
            log.info("用户 【{}】 正在非法获取项目 【{}】的文档目录列表",member.getMemberId(),projectId);
            return resultUtil.fail("非法操作，无法获得未参加项目的文档目录列表");
        }
    }

    @PostMapping("/detail/{id}")
    @ApiOperation("获取当前项目的所有文档列表夹")
    public Result getDirectoryDetailById(@RequestAttribute("member") Member member, @PathVariable("id")Integer directoryId){
        DocumentDirectory validDirectory= documentDirectoryService.getDocumentDirectoryById(directoryId);
        if(ObjectUtils.isEmpty(validDirectory)){
            log.info("用户 【{}】 正在非法获取一个不存在的文档目录列表 【{}】",member.getMemberId(),directoryId);
            return resultUtil.fail("非法操作，文档列表不存在");
        }
        Integer projectId = validDirectory.getProjectId();
        if(projectService.isMemberJoinTheProject(member.getMemberId(),projectId)){
            return resultUtil.success("获取文档列表成功",documentDirectoryService.getDocumentDirectoryById(projectId));
        }else {
            log.info("用户 【{}】 正在非法获取项目 【{}】的文档列表列表",member.getMemberId(),projectId);
            return resultUtil.fail("非法操作，无法获得未参加项目的文档列表");
        }
    }

    @PostMapping
    public Result createDirectory(@RequestAttribute("member")Member member, @RequestBody @Valid DirectoryVo directoryVo) {
        if (!projectService.isMemberJoinTheProject(member.getMemberId(), directoryVo.getProjectId())) {
            log.info("用户 【{}】 正在非法创建项目 【{}】的文档列表列表 名 【{}】", member.getMemberId(), directoryVo.getProjectId(), directoryVo.getDirectoryName());
            return resultUtil.fail("非法操作，无法创建未参加项目的文档列表列表");
        }
        if(ObjectUtils.isNotEmpty(directoryVo.getParentId()) && ObjectUtils.isEmpty(documentDirectoryService.getValidDirectory(directoryVo.getParentId()))){
            log.info("用户 【{}】 正在非法创建项目 【{}】的文档列表列表 名 【{}】,父目录 【{}】不存在", member.getMemberId(), directoryVo.getProjectId(), directoryVo.getDirectoryName(),directoryVo.getParentId());
            return resultUtil.fail("非法操作，父目录不存在");
        }

        log.info("用户 【{}】 正在创建项目 【{}】的文档列表 名 【{}】", member.getMemberId(), directoryVo.getProjectId(), directoryVo.getDirectoryName());
        if (documentDirectoryService.createDirectory(directoryVo)) {
            return resultUtil.success("创建文档列表目录成功");
        } else {
            return resultUtil.fail("创建文档列表目录失败，请查看操作日志");
        }
    }

    /**
     * 重命名
     * @param member
     * @param directoryVo
     * @return
     */
    @ApiOperation("重命名")
    @PutMapping
    public Result renameDirectory(@RequestAttribute("member")Member member, @RequestBody @Valid RenameDirectoryVo directoryVo){
        if(projectService.isMemberJoinTheProject(member.getMemberId(),directoryVo.getProjectId())){
            log.info("用户 【{}】 正在修改项目 【{}】的文档列表 名 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryName());
            DocumentDirectory validDirectory    = documentDirectoryService.getValidDirectory(directoryVo.getDirectoryId());

            if(ObjectUtils.isEmpty(validDirectory)){
                log.info("用户 【{}】 正在非法修改项目 【{}】的文档列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
                return resultUtil.fail("非法操作，无法修改未参加项目的文档列表名，文档列表夹不存在");
            }

            if(documentDirectoryService.renameDirectory(directoryVo)){
                return resultUtil.success("修改文档列表名成功");
            }else {
                return resultUtil.fail("修改文档列表失败，请查看操作日志");
            }
        }else {
            log.info("用户 【{}】 正在非法修改项目 【{}】的文档列表 名 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryName());
            return resultUtil.fail("非法操作，无法修改未参加项目的文档列表名");
        }
    }


    @ApiOperation("删除文档列表目录")
    @DeleteMapping
    @VerifyPermission("DEFAULT")
    public Result deleteDirectory(@RequestAttribute("member")Member member, @RequestBody @Valid DeleteDirectoryVo directoryVo){
        if(projectService.isMemberJoinTheProject(member.getMemberId(),directoryVo.getProjectId())){
            log.info("用户 【{}】 正在删除项目 【{}】的文档列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
            DocumentDirectory validDirectory  = documentDirectoryService.getValidDirectory(directoryVo.getDirectoryId());
            if(ObjectUtils.isEmpty(validDirectory)){
                log.info("用户 【{}】 正在非法删除项目 【{}】的文档列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
                return resultUtil.fail("非法操作，无法删除,文档列表夹不存在");
            }

            if(documentDirectoryService.deleteDirectory(directoryVo)){
                return resultUtil.success("删除文档列表目录成功");
            }else {
                return resultUtil.fail("删除文档列表失败，请查看操作日志");
            }
        }else {
            log.info("用户 【{}】 正在非法删除项目 【{}】的文档列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
            return resultUtil.fail("非法操作，无法删除未参加项目的文档列表");
        }
    }
}
