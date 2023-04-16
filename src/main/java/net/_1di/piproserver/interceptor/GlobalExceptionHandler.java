package net._1di.piproserver.interceptor;

import net._1di.piproserver.pojo.Result;
import net._1di.piproserver.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolationException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.interceptor
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-16  14:52
 */
//@RestControllerAdvice
public class GlobalExceptionHandler {


    @Autowired
    ResultUtil resultUtil;

    @ExceptionHandler(value = {Exception.class})
    public Result exceptionHandler(){
        return resultUtil.exception("系统错误").setCode(500);
    }

    @ExceptionHandler(value = {RuntimeException.class})
    public Result runtimeExceptionHandler(){
        return resultUtil.exception("运行时系统错误").setCode(500);
    }

    // <1> 处理 form data方式调用接口校验失败抛出的异常
    @ExceptionHandler(BindException.class)
    public Result bindExceptionHandler(BindException e) {
        StringBuffer sb = new StringBuffer();
        e.getBindingResult().getFieldErrors().stream().forEach((a)->{
            sb.append(a.getDefaultMessage());
            sb.append("\n");
        });
        return resultUtil.exception(sb.toString());
    }

    // <2> 处理 json 请求体调用接口校验失败抛出的异常
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result methodArgumentNotValidExceptionHandler(MethodArgumentNotValidException e) {
        List<FieldError> fieldErrors = e.getBindingResult().getFieldErrors();
        return resultUtil.exception(e.getMessage(),fieldErrors);
    }
    // <3> 处理单个参数校验失败抛出的异常
    @ExceptionHandler(ConstraintViolationException.class)
    public Result constraintViolationExceptionHandler(ConstraintViolationException e) {
        return resultUtil.exception(e.getMessage());
    }
}
