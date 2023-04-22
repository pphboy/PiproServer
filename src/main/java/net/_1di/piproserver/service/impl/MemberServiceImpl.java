package net._1di.piproserver.service.impl;

import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.controller.system.member.vo.RegisterMember;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.mapper.MemberMapper;
import net._1di.piproserver.pojo.MemberConfig;
import net._1di.piproserver.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net._1di.piproserver.utils.RedisUtil;
import net._1di.piproserver.utils.UUIDUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.Md5Crypt;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        Object object = redisUtil.get(token);
        if(ObjectUtils.isEmpty(object)){
            log.info("InValid Token => {} ",token);
            return null;
        }
        // 强转
        return (Member) object;
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
}
