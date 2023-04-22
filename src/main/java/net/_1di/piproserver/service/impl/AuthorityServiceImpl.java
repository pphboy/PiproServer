package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.Authority;
import net._1di.piproserver.mapper.AuthorityMapper;
import net._1di.piproserver.service.IAuthorityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限 服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-22
 */
@Service
public class AuthorityServiceImpl extends ServiceImpl<AuthorityMapper, Authority> implements IAuthorityService {

}
