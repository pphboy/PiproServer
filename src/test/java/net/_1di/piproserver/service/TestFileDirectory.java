package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.file.vo.DirectoryVo;
import net._1di.piproserver.controller.api.file.vo.RenameDirectoryVo;
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
//        fileDirectoryService.list();
    }

    @Test
    public void createFile(){
        DirectoryVo wordFile = new DirectoryVo().setProjectId(1).setDirectoryName("WORD文档");
        fileDirectoryService.createDirectory(wordFile);
    }
    @Test
    public void renameFileDirectory(){
        new RenameDirectoryVo().setProjectId(1).setDirectoryName("WORD文档").setDirectoryId(2);
//        fileDirectoryService.createDirectory();
    }
}

