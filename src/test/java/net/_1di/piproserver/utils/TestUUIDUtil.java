package net._1di.piproserver.utils;

import org.junit.jupiter.api.Test;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.utils
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  14:17
 */

public class TestUUIDUtil {

    @Test
    public void testUUID(){
        long start = System.currentTimeMillis();
        new UUIDUtil().uuid();
        long end = System.currentTimeMillis()-start;
        System.out.println((end)+"ms");
    }

    @Test
    public void testClassPath(){
        System.out.println(UUIDUtil.class.getResource(""));
    }
}
