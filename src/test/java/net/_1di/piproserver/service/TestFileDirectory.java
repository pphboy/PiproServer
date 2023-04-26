package net._1di.piproserver.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.service
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-26  21:28
 */
@SpringBootTest
public class TestFileDirectory {
    @Autowired
    IFileDirectoryService fileDirectoryService;

    @Test
    public void testFileD(){
        fileDirectoryService.list();
    }
}
