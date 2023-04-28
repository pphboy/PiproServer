package net._1di.piproserver.enums;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.enums
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-28  16:33
 */
public enum MessageStatus {
    DELETE(-1),
    DEFAULT(0),
    IS_READ(1);

    public final int value;

    MessageStatus(int value){
        this.value = value;
    }
}
