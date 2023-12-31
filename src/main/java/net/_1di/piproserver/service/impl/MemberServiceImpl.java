package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.controller.system.member.vo.RegisterMember;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.MissionMember;
import net._1di.piproserver.entity.ProjectMembers;
import net._1di.piproserver.mapper.MemberMapper;
import net._1di.piproserver.pojo.MemberConfig;
import net._1di.piproserver.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.service.IMissionMemberService;
import net._1di.piproserver.service.IProjectMembersService;
import net._1di.piproserver.utils.RedisUtil;
import net._1di.piproserver.utils.UUIDUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.Md5Crypt;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
@Slf4j
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements IMemberService {

    @Autowired
    UUIDUtil uuidUtil;

    @Autowired
    RedisUtil redisUtil;

    @Autowired
    IProjectMembersService projectMembersService;

    @Autowired
    IMissionMemberService missionMemberService;

    /**
     * Member传过来的密码是前端的明文密码，需要经过加密
     * @param member
     * @return
     */
    @Override
    public boolean updateUserInfo(Member member) {
        if(StringUtils.isNotEmpty(member.getPassword())){
            String salt = uuidUtil.uuid().substring(0,6);
            member.setSalt(salt);
            // 密码+盐
            String submitPasswordPlusSaltCrypt = DigestUtils.sha256Hex(member.getPassword()+salt);
            // 更新密码
            member.setPassword(submitPasswordPlusSaltCrypt);

        }
        return updateById(member);
    }

    @Override
    public boolean checkPasswordValid(Integer memberId, String password) {
        Member selectOne = getById(memberId);
        String repass = DigestUtils.sha256Hex(password+selectOne.getSalt());
        if(selectOne.getPassword().equals(repass)) {
            return true;
        }
        return false;
    }

    @Override
    public MemberConfig memberRegister(RegisterMember member) {
        // 注册时候的Token就是盐
        String token = uuidUtil.uuid();

        String salt = token.substring(0,6);

        // 密码+盐
        String submitPasswordPlusSaltCrypt = DigestUtils.sha256Hex(member.getPassword()+salt);

        Member saveMember = new Member().setEmail(member.getEmail())
                .setMemberName(member.getUsername())
                .setPassword(submitPasswordPlusSaltCrypt)
                .setSalt(salt)
                .setAuthorityType(0); // 注册默认权限为0
        MemberConfig memberConfig = new MemberConfig();

        memberConfig.setToken(token);

        // 保存
        this.save(saveMember);

        memberConfig.setMember(saveMember);

        // pipro.member.{uuid} 格式放在redis
        // Token 保三天
        setMemberConfig(saveMember.getMemberName(),token,memberConfig,3*24*3600);
//        redisUtil.set(redisUtil.memberKey(token), memberConfig,30);
        return memberConfig;
    }

    @Override
    public MemberConfig memberLogin(Member member) {
        MemberConfig memberConfig = new MemberConfig();
        String uuid = uuidUtil.uuid();
        memberConfig
                .setToken(uuid) // 设置随机TOKEN
                .setMember(member)  // 设置用户名
                // 登录时添加其他配置
        ;

        // 放到REDIS里
        setMemberConfig(member.getMemberName(),uuid,memberConfig,3*24*3600);
        return memberConfig;
    }

    @Override
    public Member getMemberByToken(String token) {
        Object object = getMember(token);
        if(ObjectUtils.isEmpty(object)){
            log.info("InValid Token => {} ",token);
            return null;
        }
        // 强转
        return ((MemberConfig) object).getMember();
    }

    @Override
    public List<Member> getMembersByProjectId(Integer projectId) {
        List<ProjectMembers> memberIdList = projectMembersService.list(new QueryWrapper<ProjectMembers>().lambda()
                .eq(ProjectMembers::getProjectId, projectId)
                .ge(ProjectMembers::getProjectAuthority, 0));// 大于等于0才是有效用户
        if (ObjectUtils.isNotEmpty(memberIdList)) {
            return list(new QueryWrapper<Member>().lambda().in(Member::getMemberId,
                    memberIdList.stream().map(a->a.getMemberId()).toArray()));
        }else return null;
    }

    @Override
    public List<Member> getMembersByMissionId(String missionId) {
        // 查询中间表
        List<MissionMember> missionMemberList = missionMemberService.list(
                // 获取当前任务所有用户的ID
           new QueryWrapper<MissionMember>().lambda().eq(MissionMember::getMissionId,missionId)
        );
        if(ObjectUtils.isEmpty(missionMemberList)) return null;

        return list(
                new QueryWrapper<Member>().lambda()
                        .in(Member::getMemberId
                                ,missionMemberList.stream().map(a->a.getMemberId()).toArray())
        );
    }

    /**
     * 拿到 pipro.member.{uuid}
     * 每一次放的时候都会把之前的Name存的Token删掉
     * @param  token
     * @return
     */
    public void setMemberConfig(String name,String token,Object data,long time){
        Object oldToken = redisUtil.get("pipro:member:name:" + name);
        // 如果存在，则删除老Token，这就是单点登录
        if(ObjectUtils.isNotEmpty(oldToken)){
            redisUtil.del("pipro:member:"+oldToken);
        }
        redisUtil.set("pipro:member:"+token,data,time);
        redisUtil.set("pipro:member:name:"+name,token,time);
    }

    public Object getMember(String token){
        return redisUtil.get("pipro:member:"+token);
    }
}
