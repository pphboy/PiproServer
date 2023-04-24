package net._1di.piproserver.enums;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.enums
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-24  22:47
 */
public interface MissionStatus {

    /**
     * 删除状态
     */
    int DELETE = -1;

    /**
     * 默认状态，即未完成状态
     */
    int DEFAULT = 0;
    /**
     * 已完成状态
     */
    int DONE = 1;
}
