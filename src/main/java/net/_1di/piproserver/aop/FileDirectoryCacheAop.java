package net._1di.piproserver.aop;

import net._1di.piproserver.annotations.cache.UpdateFileDirectoryCache;
import net._1di.piproserver.service.IDocumentDirectoryService;
import net._1di.piproserver.service.IFileDirectoryService;
import org.apache.commons.lang3.ObjectUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.aop
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  09:46
 */
@Aspect
@Component
public class FileDirectoryCacheAop {
    @Autowired
    IFileDirectoryService fileDirectoryService;
    @Autowired
    IDocumentDirectoryService documentDirectoryService;

    // 这是一个切点，相当于一个入口
    @Pointcut("@annotation(net._1di.piproserver.annotations.cache.UpdateFileDirectoryCache)")
    public void pointcutAnnotation(){
    }

    @After("pointcutAnnotation() &&  @annotation(updateFileDirectoryCache)")
    public void updateCache(JoinPoint jp, UpdateFileDirectoryCache updateFileDirectoryCache){
        if(ObjectUtils.isNotEmpty(jp.getArgs()[0])){
            BeanMap beanMap = BeanMap.create(jp.getArgs()[0]);
            // 拿到项目ID，所有的带projectId的参数都需要放在需要更新缓存的方法的第一个参数
            Integer projectId =(Integer)beanMap.get("projectId");
            if(ObjectUtils.isNotEmpty(projectId)){
                switch (updateFileDirectoryCache.type()){
                    case "FILE":
                        fileDirectoryService.updateDirectoriesIntoCache(projectId);
                        break;
                    case "DOC":
                        documentDirectoryService.updateDirectoriesIntoCache(projectId);
                        break;
                }
            }
            // 2023年4月27日 写的太棒了，给自己鼓掌
        }
    }
}
