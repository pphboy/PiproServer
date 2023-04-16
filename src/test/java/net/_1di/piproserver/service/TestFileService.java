package net._1di.piproserver.service;

import net._1di.piproserver.entity.File;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.service
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  21:10
 */
@SpringBootTest
public class TestFileService {

    @Autowired
    IFileService fileService;

    @Test
    public void testFileUUID(){
        fileService.save(new File());
    }
}


