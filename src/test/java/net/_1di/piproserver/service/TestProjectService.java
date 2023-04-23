package net._1di.piproserver.service;

import net._1di.piproserver.entity.*;
import net._1di.piproserver.utils.UUIDUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
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
    @Autowired
    IKanbanListService kanbanListService;
    @Autowired
    IProjectMissionService projectMissionService;
    @Autowired
    IMissionMemberService missionMemberService;
    @Autowired
    ILabelService labelService;

    @Test
    public void testInitProject(){

    }
    @Test
    public  void testAddKan(){
        Project project = new Project(uuidUtil.uuid()+"软件工程",uuidUtil.uuid()+"软件工程实践项目",0);
        projectService.saveProject(project,2);
        addKaban(project.getProjectId());;
        addLabel(project.getProjectId());
    }

    public void addLabel(Integer projectId){
        labelService.save(new Label(projectId,"紧急","danger"));
        labelService.save(new Label(projectId,"一般","primary"));
        labelService.save(new Label(projectId,"不重要","info"));
    }

    public void addKaban(Integer pid){
        KanbanList kanban= new KanbanList(pid,"Todo名一");
        kanbanListService.save(kanban);
        for(int i = 0; i < 15 ;i++){
            ProjectMission projectMission = new ProjectMission(kanban.getKanbanListId(),
                    "任务名"+i , "介绍"+uuidUtil.uuid(), i, LocalDateTime.now(), LocalDateTime.now(), 0, 1);
            projectMissionService.save(projectMission);
            missionMemberService.save(new MissionMember(projectMission.getMissionId(),2));
        }

        KanbanList kanban2= new KanbanList(pid,"Todo名二");
        kanbanListService.save(kanban2);
        for(int i = 0; i < 15 ;i++){
            ProjectMission projectMission = new ProjectMission(kanban2.getKanbanListId(),
                    "任务名"+i , "介绍"+uuidUtil.uuid(), i, LocalDateTime.now(), LocalDateTime.now(), 0, 1);
            projectMissionService.save(projectMission);
            missionMemberService.save(new MissionMember(projectMission.getMissionId(),2));
        }
    }
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
