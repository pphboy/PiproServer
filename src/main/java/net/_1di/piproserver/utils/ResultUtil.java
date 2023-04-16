package net._1di.piproserver.utils;

import net._1di.piproserver.pojo.Result;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.utils
 * @Author: pphboy@qq.com
 * @Description: 用于返回对象的工具类
 * @CreateTime: 2023-04-16  09:46
 */
public class ResultUtil {

    /**
     * 返回需要状态为200的Result对象
     * @param message 消息
     * @param data 数据
     * @return
     */
    public static Result success(String message,Object data){
        return new Result(200,true,message,data);
    }

    /**
     * 只返回消息
     * @param message 消息
     * @return
     */
    public static Result success(String message){
        return new Result(200,true,message,null);
    }
    /**
     * 只返回状态为403的错误消息
     * @param message 消息
     * @return
     */
    public static Result fail(String message){
        return new Result(403,false,message,null);
    }
    /**
     * 返回状态为403的Result对象
     * @param message 消息
     * @param data 数据
     * @return
     */
    public static Result fail(String message,Object data){
        return new Result(403,false,message,data);
    }

}
