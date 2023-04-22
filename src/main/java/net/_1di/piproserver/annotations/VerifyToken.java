package net._1di.piproserver.annotations;

import java.lang.annotation.*;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.annotations
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-22  16:22
 */

@Target({ElementType.TYPE,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface VerifyToken {
}
