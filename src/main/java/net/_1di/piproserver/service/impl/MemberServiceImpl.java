package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.Member;
import net._1di.piproserver.mapper.MemberMapper;
import net._1di.piproserver.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements IMemberService {

}
