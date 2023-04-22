package net._1di.piproserver.service;

import net._1di.piproserver.controller.system.member.vo.RegisterMember;
import net._1di.piproserver.entity.Member;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.pojo.MemberConfig;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IMemberService extends IService<Member> {

    /**
     * 注册时用于返回 总配置
     * @param member
     * @return
     */
    public MemberConfig memberRegister(RegisterMember member);

    /**
     * 登录时用于返回总配置
     * @param member
     * @return
     */
    public MemberConfig memberLogin(Member member);

    /**
     * 根据口令获取redis中用户的 状态
     * @param token 用户口令
     * @return
     */
    public Member getMemberByToken(String token);
}
