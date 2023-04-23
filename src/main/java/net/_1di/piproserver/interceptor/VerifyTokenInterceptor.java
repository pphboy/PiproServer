package net._1di.piproserver.interceptor;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import net._1di.piproserver.annotations.VerifyPermission;
import net._1di.piproserver.annotations.VerifyToken;
import net._1di.piproserver.entity.Authority;
import net._1di.piproserver.entity.Member;
import net._1di.piproserver.entity.MemberAuthority;
import net._1di.piproserver.service.IAuthorityService;
import net._1di.piproserver.service.IMemberAuthorityService;
import net._1di.piproserver.service.IMemberService;
import net._1di.piproserver.utils.ResultUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
    IMemberAuthorityService memberAuthorityService;
    @Autowired
    IAuthorityService authorityService;

    @Autowired
    ResultUtil resultUtil;

    private final static ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod hm = (HandlerMethod) handler;
            return verify(request,response,hm);
        }
        // 如果没有Token
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }


    /**
     *
     * @param request
     * @param response
     * @param hm
     * @return
     * @throws IOException
     */
    private boolean verify(HttpServletRequest request, HttpServletResponse response, HandlerMethod hm) throws IOException {
        // 判断是否有VerifyToken注解
        // 这里 VerifyPermission包括了VerifyToken
        // 权重更高的排在前面
        // 方法的权重大于类

        if(ObjectUtils.isNotEmpty(hm.getMethodAnnotation(VerifyPermission.class))){
            return verifyPermissions(request,response,hm);
        } else if(ObjectUtils.isNotEmpty(hm.getMethodAnnotation(VerifyToken.class))){
            return verifyToken(request,response,hm);
        }
        //如果方法没有再看类有没有
        else if(ObjectUtils.isNotEmpty(hm.getMethod().getDeclaringClass().getAnnotation(VerifyPermission.class))){
            return verifyClassPermissions(request,response,hm);
        }else if(ObjectUtils.isNotEmpty(hm.getMethod().getDeclaringClass().getAnnotation(VerifyToken.class))){
            return verifyToken(request,response,hm);
        }
//        上面是类的
        // 如果都不满足上面的条件，则说明没有使用注解，直接行行
        return true;
    }

    private boolean verifyClassPermissions(HttpServletRequest request, HttpServletResponse response, HandlerMethod handler) throws IOException {
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
            String value = handler.getMethod().getDeclaringClass().getAnnotation(VerifyPermission.class).value();
            // 查询用户的权限IDS
            List<MemberAuthority> authorityIds = memberAuthorityService.list(new QueryWrapper<MemberAuthority>().lambda()
                    .eq(MemberAuthority::getMemberId, member.getMemberId()));
            if(authorityIds.size() == 0){
                sendResult(response, 403, "权限不足，非法访问");
                return  false;
            }
            // 查询权限列表
            List<Authority> ruleList = authorityService.list(new QueryWrapper<Authority>().lambda()
                    .in(Authority::getAuthorityId,
                            // 下面是将 上面authorityIds转成数组
                            authorityIds.stream().map(a -> a.getAuthorityId()).toArray())
            );

            for (Authority authority : ruleList) {
                // 如果有一个相等直接放行
                // 拿权限的Name跟这个方法的value进行对比
                if (authority.getAuthorityName().equals(value)) {
                    // 只有放行的时候才需要设置这个member
                    request.setAttribute("member", member);
                    return true;
                }
            }
            sendResult(response, 403, "权限不足，非法访问");
            return false;
        }
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
            // 查询用户的权限IDS
            List<MemberAuthority> authorityIds = memberAuthorityService.list(new QueryWrapper<MemberAuthority>().lambda()
                    .eq(MemberAuthority::getMemberId, member.getMemberId()));
            if(authorityIds.size() == 0){
                sendResult(response, 403, "权限不足，非法访问");
                return  false;
            }
            // 查询权限列表
            List<Authority> ruleList = authorityService.list(new QueryWrapper<Authority>().lambda()
                    .in(Authority::getAuthorityId,
                            // 下面是将 上面authorityIds转成数组
                            authorityIds.stream().map(a -> a.getAuthorityId()).toArray())
            );

            for (Authority authority : ruleList) {
                // 如果有一个相等直接放行
                // 拿权限的Name跟这个方法的value进行对比
                if (authority.getAuthorityName().equals(value)) {
                    // 只有放行的时候才需要设置这个member
                    request.setAttribute("member", member);
                    return true;
                }
            }
            sendResult(response, 403, "权限不足，非法访问");
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
            // 符合以上面的条件，就可以访问 VerifyToken
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
        String json = objectMapper.writeValueAsString(
                resultUtil.fail(message)
        );
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(json);
        response.setStatus(status);
    }


}
