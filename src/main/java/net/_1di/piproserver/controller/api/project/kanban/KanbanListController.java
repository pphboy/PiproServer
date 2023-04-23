package net._1di.piproserver.controller.api.project.kanban;

import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IKanbanListService;
import net._1di.piproserver.service.IProjectService;
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
@RestController
@VerifyToken // 这里加了Token验证
@RequestMapping("/project/kanban")
@Slf4j
public class KanbanListController {

}
