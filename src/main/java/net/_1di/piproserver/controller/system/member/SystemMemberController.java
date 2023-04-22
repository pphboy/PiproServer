package net._1di.piproserver.controller.system.member;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.controller.system.member.vo.LoginMember;
import net._1di.piproserver.controller.system.member.vo.RegisterMember;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.pojo.MemberConfig;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.utils.RedisUtil;
import net._1di.piproserver.utils.ResultUtil;
import net._1di.piproserver.utils.UUIDUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.Md5Crypt;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.system
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  10:03
 */
@Slf4j
@RestController
@RequestMapping("/system")
@Api(tags = "系统用户功能")
@Validated
public class SystemMemberController {


    @Autowired
    RedisUtil redisUtil;

    @Autowired
    ResultUtil resultUtil;

    @Autowired
    UUIDUtil uuidUtil;

    @Autowired
    IMemberService memberService;

    /**
     * 登录
     * @param member
     * @return
     */
    @PostMapping("login")
    @ApiOperation("登录接口")
    public Result memberLogin(@Valid @RequestBody LoginMember member){
        Member selectOne = memberService.getOne(
                new QueryWrapper<Member>().lambda().eq(Member::getMemberName,member.getUsername()) // 用户
        );
        if(ObjectUtils.isEmpty(selectOne)){
            return resultUtil.fail("用户不存在");
        }
        // 密码+盐
        String repass = DigestUtils.sha256Hex(member.getPassword()+selectOne.getSalt());
        if(selectOne.getPassword()
                .equals(repass)){
            // 更新REDIS
            // 查到的可以用第二遍
            return resultUtil.success("登录成功",memberService.memberLogin(selectOne));
        }else {
            return resultUtil.fail("密码错误");
        }

    }

    /**
     * 注册
     * @param registerMember
     * @return
     */
    @PostMapping("register")
    @ApiOperation("注册接口")
    public Result memberRegister(@Valid @RequestBody RegisterMember registerMember){
        Member selectOne = memberService.getOne(
                new QueryWrapper<Member>().lambda().eq(Member::getMemberName, registerMember.getUsername()) // 用户
        );
        if(ObjectUtils.isNotEmpty(selectOne)){
            return resultUtil.fail("该用户名已经被注册");
        }
        selectOne = null;
        selectOne= memberService.getOne(
                new QueryWrapper<Member>().lambda().eq(Member::getEmail, registerMember.getEmail()) // 邮箱
        );
        if(ObjectUtils.isNotEmpty(selectOne)){
            return resultUtil.fail("该邮箱已经被注册了");
        }
        MemberConfig memberConfig = memberService.memberRegister(registerMember);
        return resultUtil.success("注册成功",memberConfig);
    }
}
