package net._1di.piproserver.configuration;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.coyote.Request;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * @Author: 徐一杰
 * @date: 2022/3/12
 * @Description: Swagger3配置文件
*/
@SpringBootConfiguration
@EnableOpenApi
public class Swagger3Config {
    /**
     *   application中还配置了mvc，因为springboot2.6.1与swagger3不兼容
     */

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.OAS_30)
                .apiInfo(apiInfo())
                // ture 启用Swagger3.0， false 禁用（生产环境要禁用）
                .enable(true)
                .select()
                // 扫描的路径使用@Api的controller
                .apis(RequestHandlerSelectors.basePackage("net._1di.piproserver.controller.api"))
//                .apis(RequestHandlerSelectors.basePackage("net._1di.piproserver.controller.system"))
                // 指定路径处理PathSelectors.any()代表所有的路径
                .paths(PathSelectors.any())
                .build()
                .groupName("API");
    }

    @Bean
    public Docket createRestSystem() {
        return new Docket(DocumentationType.OAS_30)
                .apiInfo(apiInfo())
                // ture 启用Swagger3.0， false 禁用（生产环境要禁用）
                .enable(true)
                .select()
                // 扫描的路径使用@Api的controller
//                .apis(RequestHandlerSelectors.withMethodAnnotation(Api.class))
                .apis(RequestHandlerSelectors.basePackage("net._1di.piproserver.controller.system"))
                // 指定路径处理PathSelectors.any()代表所有的路径
                .paths(PathSelectors.any())
                .build()
                .groupName("系统功能");
    }

    /**
     * API 页面上半部分展示信息
     */
    ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("SWAGGER API文档")
                .description("PIPRO接口文档")
                .contact(new Contact("Markpi", "http://pipro.12346666.xyz", "pphboy@qq.com"))
                .version("0.1")
                .build();
    }
}

