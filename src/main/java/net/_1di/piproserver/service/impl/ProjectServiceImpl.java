package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.Project;
import net._1di.piproserver.mapper.ProjectMapper;
import net._1di.piproserver.service.IProjectService;
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
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements IProjectService {

}
