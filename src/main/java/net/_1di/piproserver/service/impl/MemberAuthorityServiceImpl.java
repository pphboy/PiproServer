package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.MemberAuthority;
import net._1di.piproserver.mapper.MemberAuthorityMapper;
import net._1di.piproserver.service.IMemberAuthorityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户包含多个权限 服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-22
 */
@Service
public class MemberAuthorityServiceImpl extends ServiceImpl<MemberAuthorityMapper, MemberAuthority> implements IMemberAuthorityService {

}
