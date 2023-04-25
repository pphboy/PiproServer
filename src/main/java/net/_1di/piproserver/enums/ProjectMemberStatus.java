package net._1di.piproserver.enums;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.enums
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-25  08:44
 * @Descrption: 设用户在项目中的权限状态
 */
public interface ProjectMemberStatus {
    /**
     * 禁用状态
     */
    int DISABLED = -2;
    /**
     * 删除状态
     */
    int DELETE = -1;
    /**
     * 大于默认状态，都可以被查询
     * 默认状态
     */
    int DEFAULT = 0;
    /**
     * 管理员
     */
    int ADMIN = 100;

}
