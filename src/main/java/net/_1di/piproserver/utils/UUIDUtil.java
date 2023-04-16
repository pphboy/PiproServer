package net._1di.piproserver.utils;

import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.utils
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  14:15
 */
@Component
public class UUIDUtil {

    public String uuid(){
        return UUID.randomUUID().toString().toUpperCase().replaceAll("-","");
    }
}
