package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.ProjectMembers;
import net._1di.piproserver.mapper.ProjectMembersMapper;
import net._1di.piproserver.service.IProjectMembersService;
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
public class ProjectMembersServiceImpl extends ServiceImpl<ProjectMembersMapper, ProjectMembers> implements IProjectMembersService {

}
