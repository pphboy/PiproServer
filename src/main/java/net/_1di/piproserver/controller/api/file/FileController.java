package net._1di.piproserver.controller.api.file;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.file.dto.FileDto;
import net._1di.piproserver.controller.api.file.vo.DeleteFileVo;
import net._1di.piproserver.controller.api.file.vo.FileUpdateVo;
import net._1di.piproserver.entity.File;
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
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@RestController
@Api(tags = "文件接口")
@VerifyToken
@Slf4j
@RequestMapping("/project/file")
public class FileController {


    @Autowired
    IFileService fileService;
    @Autowired
    IProjectService projectService;
    @Autowired
    IFileDirectoryService fileDirectoryService;
    @Autowired
    ResultUtil resultUtil;

    @PostMapping("/project/{projectId}/{directoryId}")
    @ApiOperation("文件上传接口")
    public Result uploadFile(@RequestAttribute("member") Member member,
                         @PathVariable("projectId") Integer projectId,
                @PathVariable("directoryId") Integer directoryId
            ,@RequestParam("file") MultipartFile file) throws IOException {
        // 判断当前用户是不是在本项目内
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),projectId)){
            log.info("用户【{}】  正在尝试非法上传文件 到 项目【{}】",member.getMemberId(),projectId);
            return resultUtil.fail("非法操作，请未参加该项目");
        }
        FileDirectory validDirectory = fileDirectoryService.getValidDirectory(directoryId);
        if(ObjectUtils.isEmpty(validDirectory)){
            log.info("用户【{}】  正在尝试非法上传文件 到 项目【{}】 文件目录 【{}】: 文件目录不存在",member.getMemberId(),projectId,directoryId);
            return resultUtil.fail("非法操作，文件目录不存在");
        }
        if(validDirectory.getProjectId() != projectId){
            log.info("用户【{}】  正在尝试非法上传文件 到 项目【{}】 , 文件目录【{}】 与 项目不相关",member.getMemberId(),projectId,directoryId);
            return resultUtil.fail("非法操作，文件目录不存在");
        }
        if(fileService.saveFile(new FileDto(projectId,member,directoryId,file))){
            return resultUtil.success("上传文件成功");
        }else {
            return resultUtil.fail("上传文件失败，请查看日志");
        }
    }

    /**
     * 修改文件
     * @param member
     * @param  fileUpdateVo
     * @return
     */
    @PostMapping
    @ApiOperation("文件重命名")
    public Result fileRename(@RequestAttribute("member") Member member, @RequestBody @Valid FileUpdateVo fileUpdateVo){
        // 判断当前用户是不是在本项目内
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),fileUpdateVo.getProjectId())){
            log.info("用户【{}】 正在尝试修改项目[{}]中的文件[{}]文件名,但其未参与本项目",member.getMemberId(),fileUpdateVo.getProjectId(),fileUpdateVo.getFileId());
            return resultUtil.fail("非法操作，请未参加该项目");
        }
        // 合法的文件
        File validFile = fileService.getValidFile(fileUpdateVo.getFileId());
        if(ObjectUtils.isEmpty(validFile)){
            log.info("用户【{}】 正在尝试修改项目[{}] 中的文件[{}]文件名,但文件不存在",member.getMemberId(),fileUpdateVo.getProjectId(),fileUpdateVo.getFileId());
            return resultUtil.fail("非法操作，文件不存在");
        }
        // 判断文件目录是否合法，如果文件目录不合法，则其文件也不能修改
        FileDirectory validDirectory = fileDirectoryService.getValidDirectory(validFile.getFileDirectoryId());
        if(ObjectUtils.isEmpty(validDirectory)){
            log.info("用户【{}】  正在尝试非法修改 项目【{}】文件目录【{}】文件【{}】: 文件目录不存在",member.getMemberId(),fileUpdateVo.getProjectId(),validFile.getFileDirectoryId(),fileUpdateVo.getFileId());
            return resultUtil.fail("非法操作，文件目录不存在");
        }
        if(fileService.fileRename(fileUpdateVo)){
            return resultUtil.success("修改文件文件成功");
        }else {
            return resultUtil.fail("删除文件失败，请查看服务器日志");
        }
    }


    /**
     * 删除文件
     */
    @DeleteMapping
    @ApiOperation("删除文件")
    public Result deleteFile(@RequestAttribute("member") Member member, @RequestBody @Valid DeleteFileVo deleteFileVo){
        // 判断当前用户是不是在本项目内
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),deleteFileVo.getProjectId())){
            log.info("用户【{}】 正在尝试删除项目[{}]中的文件[{}],但其未参与本项目",member.getMemberId(),deleteFileVo.getProjectId(),deleteFileVo.getFileId());
            return resultUtil.fail("非法操作，请未参加该项目");
        }
        // 合法的文件
        File validFile = fileService.getValidFile(deleteFileVo.getFileId());
        if(ObjectUtils.isEmpty(validFile)){
            log.info("用户【{}】 正在尝试删除项目[{}] 中的文件[{}],但文件不存在",member.getMemberId(),deleteFileVo.getProjectId(),deleteFileVo.getFileId());
            return resultUtil.fail("非法操作，文件不存在");
        }
        // 判断文件目录是否合法
        FileDirectory validDirectory = fileDirectoryService.getValidDirectory(validFile.getFileDirectoryId());
        if(ObjectUtils.isEmpty(validDirectory)){
            log.info("用户【{}】,正在尝试非法删除到项目【{}】文件目录【{}】中的文件: 文件目录不存在",member.getMemberId(),deleteFileVo.getProjectId(),validFile.getFileDirectoryId());
            return resultUtil.fail("非法操作，文件目录不存在");
        }
        if(fileService.deleteFile(deleteFileVo)){
            return resultUtil.success("删除文件成功");
        }else {
            return resultUtil.fail("删除文件失败，请查看服务器日志");
        }
    }

}
