package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.entity.Project;
import net._1di.piproserver.entity.ProjectMembers;
import net._1di.piproserver.mapper.ProjectMapper;
import net._1di.piproserver.service.IProjectMembersService;
import net._1di.piproserver.service.IProjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Stream;

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


    @Autowired
    IProjectMembersService projectMembersService;

    @Override
    public boolean saveProject(Project project, Integer memberId) {
        save(project);

        ProjectMembers creator=  new ProjectMembers(project.getProjectId(),memberId,100);
        projectMembersService.save(creator);
        return false;
    }

    @Override
    public List<Project> getProjectById(Integer memberId) {
        List<ProjectMembers> memberList = projectMembersService.list(new QueryWrapper<ProjectMembers>().lambda()
                .eq(ProjectMembers::getMemberId, memberId));
        // 如果为空，直接返回null 即可
        if(ObjectUtils.isEmpty(memberList)) return null;


        List<Project> projectList = list(new QueryWrapper<Project>().lambda().in(Project::getProjectId,
                memberList.stream().map(a -> a.getProjectId()).toArray()        // 这个相当于是直接把memberList里的list做成 项目ID集合 类似于 {1,2,3,5}
        ));
        return projectList;
    }
}
