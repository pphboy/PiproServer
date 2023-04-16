package net._1di.piproserver.system;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.Md5Crypt;
import org.junit.jupiter.api.Test;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.system
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  21:51
 */
public class TestMD5Crypt {

    @Test
    public void testMD5(){
        System.out.println(DigestUtils.sha1Hex(("123456"+"A24FA0").getBytes()));
        System.out.println(DigestUtils.sha1Hex(("123456"+"A24FA0").getBytes()));
        System.out.println(DigestUtils.md5Hex(("123456"+"A24FA0").getBytes()));
        System.out.println(DigestUtils.md5Hex(("123456"+"A24FA0").getBytes()));
    }
}
