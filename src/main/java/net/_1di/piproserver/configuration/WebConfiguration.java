package net._1di.piproserver.configuration;

import net._1di.piproserver.interceptor.VerifyTokenInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.configuration
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-22  16:26
 */
@Configuration
public class WebConfiguration extends WebMvcConfigurationSupport {

    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(verifyTokenInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/system/**");
    }

    @Bean
    public VerifyTokenInterceptor verifyTokenInterceptor(){
        return new VerifyTokenInterceptor();
    }
}
