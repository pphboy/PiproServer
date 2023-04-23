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

    /**
     * 判断 memberId 是否 在该项目 中
     * @param memberId
     * @param projectId
     * @return
     */
    public boolean isMemberJoinTheProject(Integer memberId,Integer projectId);

    /**
     * 获取项目详情
     * @param projectId
     * @return
     */
    Project getProjectDetail(Integer projectId);
}
