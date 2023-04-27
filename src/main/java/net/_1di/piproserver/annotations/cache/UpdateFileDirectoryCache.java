package net._1di.piproserver.annotations.cache;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.lang.annotation.*;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.annotations.cache
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  09:49
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface UpdateFileDirectoryCache {
    String type() ;
}
