package net._1di.piproserver.service;

import net._1di.piproserver.controller.system.member.vo.RegisterMember;
import net._1di.piproserver.entity.Member;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.pojo.MemberConfig;

import java.util.List;

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
     * 更新 用户 邮箱或密码
     * @param member
     * @return
     */
    boolean updateUserInfo(Member member);

    /**
     * 判断成员的密码是否正确
     * @param memberId
     * @param password
     * @return
     */
    boolean checkPasswordValid(Integer memberId,String password);
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

    /**
     * 根据项目ID获取所有有效用户列表
     * @param projectId
     * @return
     */
    public List<Member> getMembersByProjectId(Integer projectId);

    /**
     * 获取任务下 所有的用户
     * @param missionId 任务ID
     * @return
     */
    public List<Member> getMembersByMissionId(String missionId);
}
