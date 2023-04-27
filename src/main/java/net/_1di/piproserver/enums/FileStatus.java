package net._1di.piproserver.enums;

import net._1di.piproserver.entity.File;
import net._1di.piproserver.entity.FileDirectory;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.enums
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  08:11
 */
public enum FileStatus {
    /**
     * 删除状态
     */
    DELETE(-1),
    /**
     * 禁用状态
     */
    DISABLED(-2),
    /**
     * 默认状态
     */
    DEFAULT(0),
    ;

    public final int value;

    FileStatus(int value){
        this.value = value;
    }

    public static FileStatus getStatus(int value){
        switch (value){
            case 0:
                return FileStatus.DEFAULT;
            case -1:
                return FileStatus.DELETE;
            case -2:
                return FileStatus.DISABLED;

        }
        return null;
    }

}
