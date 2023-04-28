package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.file.vo.DeleteDirectoryVo;
import net._1di.piproserver.controller.api.file.vo.DirectoryVo;
import net._1di.piproserver.controller.api.file.vo.RenameDirectoryVo;
import net._1di.piproserver.entity.DocumentDirectory;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.entity.FileDirectory;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IDocumentDirectoryService extends IService<DocumentDirectory> {

    /**
     * 获取项目根目录所有文档目录
     * @param projectId
     * @return
     */
    List<DocumentDirectory> getDocumentDirectoriesByProjectId(Integer projectId);

    /**
     * 更新数据到缓存中
     * @param projectId
     */
    void updateDirectoriesIntoCache(Integer projectId);

    List<DocumentDirectory> getCacheDocumentDirectoriesByProjectId(Integer projectId);


    /**
     * 获取目录下所有文件和目录
     * @param directoryId
     * @return
     */
    DocumentDirectory getDocumentDirectoryById(Integer directoryId);


    /**
     * 判断文件是否存在，是否正常
     * @return
     */
    DocumentDirectory getValidDirectory(Integer directoryId);

    /**
     * 创建一个目录
     * @param directoryVo
     * @return
     */
    boolean createDirectory(DirectoryVo directoryVo);

    /**
     * 修改一个目录的名称
     * @param directoryVo
     * @return
     */
    boolean renameDirectory(RenameDirectoryVo directoryVo);

    /**
     * 删除一个目录
     */
    boolean deleteDirectory(DeleteDirectoryVo directoryVo);
}
