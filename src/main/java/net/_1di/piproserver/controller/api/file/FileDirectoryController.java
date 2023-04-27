package net._1di.piproserver.controller.api.file;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.file.vo.DeleteDirectoryVo;
import net._1di.piproserver.controller.api.file.vo.DirectoryVo;
import net._1di.piproserver.controller.api.file.vo.RenameDirectoryVo;
import net._1di.piproserver.entity.FileDirectory;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IFileDirectoryService;
import net._1di.piproserver.service.IFileService;
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
@RequestMapping("/project/directory")
@Api(tags = "文件夹接口")
@VerifyToken
@Slf4j
public class FileDirectoryController {

    @Autowired
    IFileDirectoryService fileDirectoryService;
    @Autowired
    ResultUtil resultUtil;
    @Autowired
    IProjectService projectService;

    @GetMapping("/{id}")
    @ApiOperation("获取当前项目的所有文件夹")
    public Result getProjectFileList(@RequestAttribute("member") Member member, @PathVariable("id")Integer projectId){

        if(projectService.isMemberJoinTheProject(member.getMemberId(),projectId)){
            return resultUtil.success("获取文件成功",fileDirectoryService.getCacheFileDirectoriesByProjectId(projectId));
        }else {
            log.info("用户 【{}】 正在非法获取项目 【{}】的文件列表",member.getMemberId(),projectId);
            return resultUtil.fail("非法操作，无法获得未参加项目的文件列表");
        }
    }

    @PostMapping
    public Result createDirectory(@RequestAttribute("member")Member member, @RequestBody @Valid DirectoryVo directoryVo) {
        if (!projectService.isMemberJoinTheProject(member.getMemberId(), directoryVo.getProjectId())) {
            log.info("用户 【{}】 正在非法创建项目 【{}】的文件列表 名 【{}】", member.getMemberId(), directoryVo.getProjectId(), directoryVo.getDirectoryName());
            return resultUtil.fail("非法操作，无法创建未参加项目的文件列表");
        }
        if(ObjectUtils.isNotEmpty(directoryVo.getParentId()) && ObjectUtils.isEmpty(fileDirectoryService.getValidDirectory(directoryVo.getParentId()))){
            log.info("用户 【{}】 正在非法创建项目 【{}】的文件列表 名 【{}】,父目录 【{}】不存在", member.getMemberId(), directoryVo.getProjectId(), directoryVo.getDirectoryName(),directoryVo.getParentId());
            return resultUtil.fail("非法操作，父目录不存在");
        }

        log.info("用户 【{}】 正在创建项目 【{}】的文件列表 名 【{}】", member.getMemberId(), directoryVo.getProjectId(), directoryVo.getDirectoryName());
        if (fileDirectoryService.createDirectory(directoryVo)) {
            return resultUtil.success("创建文件目录成功");
        } else {
            return resultUtil.fail("创建文件目录失败，请查看操作日志");
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
            log.info("用户 【{}】 正在修改项目 【{}】的文件列表 名 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryName());
            FileDirectory validDirectory    = fileDirectoryService.getValidDirectory(directoryVo.getDirectoryId());

            if(ObjectUtils.isEmpty(validDirectory)){
                log.info("用户 【{}】 正在非法修改项目 【{}】的文件列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
                return resultUtil.fail("非法操作，无法修改未参加项目的文件列表名，文件夹不存在");
            }

            if(fileDirectoryService.renameDirectory(directoryVo)){
                return resultUtil.success("修改文件列表名成功");
            }else {
                return resultUtil.fail("修改文件列表失败，请查看操作日志");
            }
        }else {
            log.info("用户 【{}】 正在非法修改项目 【{}】的文件列表 名 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryName());
            return resultUtil.fail("非法操作，无法修改未参加项目的文件列表名");
        }
    }


    @ApiOperation("删除文件目录")
    @DeleteMapping
    @VerifyPermission("DEFAULT")
    public Result deleteDirectory(@RequestAttribute("member")Member member, @RequestBody @Valid DeleteDirectoryVo directoryVo){
        if(projectService.isMemberJoinTheProject(member.getMemberId(),directoryVo.getProjectId())){
            log.info("用户 【{}】 正在删除项目 【{}】的文件列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
            FileDirectory validDirectory    = fileDirectoryService.getValidDirectory(directoryVo.getDirectoryId());

            if(ObjectUtils.isEmpty(validDirectory)){
                log.info("用户 【{}】 正在非法删除项目 【{}】的文件列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
                return resultUtil.fail("非法操作，无法删除未参加项目的文件列表名，文件夹不存在");
            }

            if(fileDirectoryService.deleteDirectory(directoryVo)){
                return resultUtil.success("删除文件目录成功");
            }else {
                return resultUtil.fail("删除文件列表失败，请查看操作日志");
            }
        }else {
            log.info("用户 【{}】 正在非法删除项目 【{}】的文件列表 ID 【{}】",member.getMemberId(),directoryVo.getProjectId(),directoryVo.getDirectoryId());
            return resultUtil.fail("非法操作，无法删除未参加项目的文件列表");
        }
    }


}
