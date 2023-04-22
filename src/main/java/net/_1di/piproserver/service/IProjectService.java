package net._1di.piproserver.service;

import net._1di.piproserver.entity.Project;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IProjectService extends IService<Project> {


    public boolean saveProject(Project project,Integer memberId);
    public List<Project> getProjectById(Integer memberId);
}
