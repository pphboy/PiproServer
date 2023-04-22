package net._1di.piproserver.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.service
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-22  16:02
 */
@SpringBootTest
public class TestProjectMission {

    @Autowired
    IProjectMissionService projectMissionService;

    @Test
    public void testGetMissionById(){

    }
}
