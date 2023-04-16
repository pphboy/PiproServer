package net._1di.piproserver.controller.system;

import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.utils.ResultUtil;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.system
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  10:03
 */
@RestController
@RequestMapping("/system")
public class SysLoginController {


    @PostMapping("login")
    public Result memberLogin(){

        return ResultUtil.success("登录成功");
    }
}
