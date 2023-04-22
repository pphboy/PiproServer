package net._1di.piproserver.service;

import net._1di.piproserver.entity.Authority;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.service
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-22  15:24
 */
@SpringBootTest
public class TestAuthorityService {

    @Autowired
    IAuthorityService authorityService;

    /**
     * 添加三个默认权限
     */
    @Test
    public void testAddAuthority(){
        Authority[] alist = {
            new Authority("DEFAULT", "默认用户权限"),
            new Authority("ADMIN", "管理员权限"),
            new Authority("PROJECT_ADMIN", "项目管理员"),
        };

        for (Authority a :
                alist) {
            authorityService.save(a);
        }
    }
}
