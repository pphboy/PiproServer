package net._1di.piproserver.controller.api.document;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.api.document.vo.CreateDocumentVo;
import net._1di.piproserver.controller.api.document.vo.DeleteDocumentVo;
import net._1di.piproserver.controller.api.document.vo.UpdateDocumentVo;
import net._1di.piproserver.controller.api.file.dto.FileDto;
import net._1di.piproserver.controller.api.file.vo.DeleteFileVo;
import net._1di.piproserver.controller.api.file.vo.FileUpdateVo;
import net._1di.piproserver.entity.*;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.*;
import net._1di.piproserver.utils.ResultUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
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
@VerifyToken
@RequestMapping("/project/document")
@Slf4j
@Api(tags = "文档接口")
public class DocumentController {
    @Autowired
    IDocumentService documentService;
    @Autowired
    IDocumentDirectoryService documentDirectoryService;

    @Autowired
    IProjectService projectService;
    @Autowired
    ResultUtil resultUtil;

    @PostMapping
    @ApiOperation("文档创建目录")
    public Result creaeteDocument(@RequestAttribute("member") Member member, @RequestBody @Valid CreateDocumentVo createDocumentVo) throws IOException {
        // 判断当前用户是不是在本项目内
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),createDocumentVo.getProjectId())){
            log.info("用户【{}】  正在尝试非法创建文档 到 项目【{}】",member.getMemberId(),createDocumentVo.getProjectId());
            return resultUtil.fail("非法操作，请未参加该项目");
        }
        DocumentDirectory validDirectory = documentDirectoryService.getValidDirectory(createDocumentVo.getDirectoryId());
        if(ObjectUtils.isEmpty(validDirectory)){
            log.info("用户【{}】  正在尝试非法创建文档 到 项目【{}】 文档目录 【{}】: 文档目录不存在",member.getMemberId(),createDocumentVo.getProjectId(),createDocumentVo.getDirectoryId());
            return resultUtil.fail("非法操作，文档目录不存在");
        }
        if(validDirectory.getProjectId() != createDocumentVo.getProjectId()){
            log.info("用户【{}】  正在尝试非法创建文档 到 项目【{}】 , 文档目录【{}】 与 项目不相关",member.getMemberId(),createDocumentVo.getProjectId(),createDocumentVo.getDirectoryId());
            return resultUtil.fail("非法操作，文档目录不存在");
        }

        if(documentService.saveDocument(createDocumentVo)){
            return resultUtil.success("创建文档成功");
        }else {
            return resultUtil.fail("创建失败，请查看日志");
        }
    }

    /**
     * 修改文档
     * @param member
     * @param  documentVo
     * @return
     */
    @PutMapping
    @ApiOperation("文档更新")
    public Result documentRename(@RequestAttribute("member") Member member
            , @RequestBody @Valid UpdateDocumentVo documentVo){
        // 判断当前用户是不是在本项目内
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),documentVo.getProjectId())){
            log.info("用户【{}】 正在尝试修改项目[{}]中的文档[{}],但其未参与本项目",member.getMemberId(),documentVo.getProjectId(),documentVo.getDocumentId());
            return resultUtil.fail("非法操作，请未参加该项目");
        }
        // 合法的文档
        Document validDocument = documentService.getValidDocument(documentVo.getDocumentId());
        if(ObjectUtils.isEmpty(validDocument)){
            log.info("用户【{}】 正在尝试修改项目[{}] 中的文档[{},但文档不存在",member.getMemberId(),documentVo.getProjectId(),documentVo.getDocumentId());
            return resultUtil.fail("非法操作，文档不存在");
        }
        if(documentService.updateDocument(documentVo)){
            return resultUtil.success("修改文档文档成功");
        }else {
            return resultUtil.fail("删除文档失败，请查看服务器日志");
        }
    }


    /**
     * 删除文档
     */
    @DeleteMapping
    @ApiOperation("删除文档")
    public Result deleteFile(@RequestAttribute("member") Member member, @RequestBody @Valid DeleteDocumentVo deleteDocumentVo){
        // 判断当前用户是不是在本项目内
        if(!projectService.isMemberJoinTheProject(member.getMemberId(),deleteDocumentVo.getProjectId())){
            log.info("用户【{}】 正在尝试删除项目[{}]中的文档[{}],但其未参与本项目",member.getMemberId(),deleteDocumentVo.getProjectId(),deleteDocumentVo.getDocumentId());
            return resultUtil.fail("非法操作，请未参加该项目");
        }
        // 合法的文档
        Document validDocument = documentService.getValidDocument(deleteDocumentVo.getDocumentId());
        if(ObjectUtils.isEmpty(validDocument)){
            log.info("用户【{}】 正在尝试删除项目[{}] 中的文档[{}],但文档不存在",member.getMemberId(),deleteDocumentVo.getProjectId(),deleteDocumentVo.getDocumentId());
            return resultUtil.fail("非法操作，文档不存在");
        }

        if(documentService.deleteFile(deleteDocumentVo)){
            return resultUtil.success("删除文档成功");
        }else {
            return resultUtil.fail("删除文档失败，请查看服务器日志");
        }
    }
}
