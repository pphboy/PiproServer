package net._1di.piproserver.controller.api.file;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.file.dto.FileDto;
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

    @DeleteMapping("/{fid}")
    public Result deleteFile(@RequestAttribute("member") Member member, @PathVariable("fid")Integer fileId){
        return  null;
    }

}
