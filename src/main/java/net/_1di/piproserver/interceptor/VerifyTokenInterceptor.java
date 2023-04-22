package net._1di.piproserver.interceptor;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.service.IAuthorityService;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.utils.ResultUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.annotation.Annotation;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.interceptor
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  14:50
 */

@Slf4j
public class VerifyTokenInterceptor implements HandlerInterceptor {

    @Autowired
    IMemberService memberService;
    @Autowired
    IAuthorityService authorityService;
    @Autowired
    ResultUtil resultUtil;

    private final static ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(handler instanceof HandlerMethod){
            HandlerMethod hm = (HandlerMethod) handler;
            // 判断是否有VerifyToken注解
            // 这里 VerifyPermission包括了VerifyToken
            // 权重更高的排在前面
            if(ObjectUtils.isNotEmpty(hm.getMethodAnnotation(VerifyPermission.class))){
                return verifyPermissions(request,response,hm);
            } else if(ObjectUtils.isNotEmpty(hm.getMethodAnnotation(VerifyToken.class))){
                return verifyToken(request,response,handler);
            }
        }
        // 如果没有Token
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    /**
     * 验证权限
     * @param request
     * @param response
     * @param handler
     * @return
     */
    private boolean verifyPermissions(HttpServletRequest request, HttpServletResponse response, HandlerMethod handler) throws IOException {
        String token = request.getHeader("Authorization");
        if(StringUtils.isEmpty(token)){
            sendResult(response,403,"口令为空，非法访问");
            return false;
        }
        // 通过Token获取Mapper
        Member member = memberService.getMemberByToken(token);
        if(ObjectUtils.isEmpty(member)){
            log.debug("Token {} 不存在 member",token);
            // 有Token不存在Member，则说明登录已失效
            sendResult(response,403,"登录已失效，请重新登录");
            return false;
        }else {
            // 判断权限是否在用户权限内，如果不在，返回 权限不足，非法访问
            // 拿到值
            String value = handler.getMethodAnnotation(VerifyPermission.class).value();
            String[] ruleList = {"DEFAULT"};
            for(String tmp: ruleList){
                // 如果有一个相等直接放行
                if(tmp.equals(value)){
                    // 只有放行的时候才需要设置这个member
                    request.setAttribute("member",member);
                    return true;
                }
            }
            sendResult(response,403,"权限不足，非法访问");
            return false;
        }
    }

    /**
     * TODO: 需要写一个response转发，就是有些东西不存在，什么的需要返回错误信息，但状态还是得用200
     * TODO: 权限验证，有些是加在类上，有些是加在方法上
     */
    /**
     * 如果有Token和Member则用此函数来验证
     * @param request
     * @param response
     * @param handler
     * @return
     */
    private boolean verifyToken(HttpServletRequest request,HttpServletResponse response,Object handler) throws IOException {
        String token = request.getHeader("Authorization");
        if(StringUtils.isEmpty(token)){
            sendResult(response,403,"口令为空，非法访问");
            return false;
        }
        // 通过Token获取Mapper
        Member member = memberService.getMemberByToken(token);
        if(ObjectUtils.isEmpty(member)){
            log.debug("Token {} 不存在 member",token);
            // 有Token不存在Member，则说明登录已失效
            sendResult(response,403,"登录已失效，请重新登录");
            return false;
        }else {
            request.setAttribute("member",member);
            return true;
        }
    }

    /**
     * 返回JSON 结果
     * @param response
     * @param status
     * @param message
     * @throws IOException
     */
    public void sendResult(HttpServletResponse response,int status,String message) throws IOException {
        response.getWriter().print(objectMapper.writeValueAsBytes(
                resultUtil.fail(message)
        ));
        response.setStatus(status);
    }


}
