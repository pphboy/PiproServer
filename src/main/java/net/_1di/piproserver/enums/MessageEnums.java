package net._1di.piproserver.enums;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.enums
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-28  16:20
 */
public enum MessageEnums {
    MOVE_TASK("");
    String message;

    MessageEnums(String message){
        this.message = message;
    }

    String value(){
        return message;
    }

    String moveTask(String taskName){
        return String.format(this.message,taskName);
    }
}
