package net._1di.piproserver.controller.api.member;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.controller.system.member.vo.UpdateMemberVo;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.utils.ResultUtil;
import org.apache.commons.lang3.StringUtils;
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
@Api(tags = "用户接口")
@Slf4j
@RequestMapping("/project/member")
public class MemberController {

    @Autowired
    IMemberService memberService;

    @Autowired
    ResultUtil resultUtil;

    /**
     * 修改 邮箱和密码
     */
    @PostMapping("userinfo")
    @VerifyToken
    @ApiOperation("更新成员信息")
    public Result updateUserInfo(@RequestAttribute("member") Member member, @RequestBody @Valid UpdateMemberVo updateMemberVo){
        // 判断原密码是否合法
        if(memberService.checkPasswordValid(member.getMemberId(),updateMemberVo.getPassword())){
            log.info("用户[{}]在尝试修改用户重要信息，但密码错误",member.getMemberId());
            return resultUtil.fail("原密码错误");
        }
        Member updateMember = new Member();
        updateMember.setEmail(member.getEmail());
        updateMember.setMemberId(member.getMemberId());

        if(StringUtils.isNotEmpty(updateMemberVo.getPassword()) ){
            // 修改原密码
            if(updateMemberVo.getPassword().equals(updateMemberVo.getRepassword())){
                updateMember.setPassword(updateMemberVo.getPassword());
            }else {
                log.info("用户[{}]在尝试修改用户重要信息，但再次密码不一致",member.getMemberId());
                return resultUtil.fail("两次密码不一致");
            }
        }

        if(memberService.updateUserInfo(updateMember)){
            return resultUtil.success("修改成功");
        }else {
            return resultUtil.fail("修改失败，请查看日志");
        }
    }
}
