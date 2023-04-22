package net._1di.piproserver.service;

import net._1di.piproserver.entity.Project;
import net._1di.piproserver.utils.UUIDUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.service
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-22  15:29
 */
@SpringBootTest
public class TestProjectService {
    @Autowired
    IProjectService projectService;

    @Autowired
    UUIDUtil uuidUtil;
    @Test
    public void testAddProject(){
        short status = 0;
        Project project = new Project("软件工程","软件工程实践项目",0);
        projectService.save(project);
    }

    @Test
    public void createProject(){
        for (int i = 0;i<30;i++){
            Project project = new Project(uuidUtil.uuid()+"软件工程"+i,uuidUtil.uuid()+"软件工程实践项目"+i,0);
            projectService.saveProject(project,1);
        }
    }

    @Test
    public void getProjectListById(){
        List<Project> projectById = projectService.getProjectById(1);
        for(Project p: projectById){
            System.out.println(p);
        }
    }
}
