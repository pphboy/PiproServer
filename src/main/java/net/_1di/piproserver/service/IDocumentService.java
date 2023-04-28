package net._1di.piproserver.service;

import net._1di.piproserver.controller.api.document.vo.CreateDocumentVo;
import net._1di.piproserver.controller.api.document.vo.DeleteDocumentVo;
import net._1di.piproserver.controller.api.document.vo.UpdateDocumentVo;
import net._1di.piproserver.controller.api.file.dto.FileDto;
import net._1di.piproserver.controller.api.file.vo.DeleteFileVo;
import net._1di.piproserver.controller.api.file.vo.FileUpdateVo;
import net._1di.piproserver.entity.Document;
import com.baomidou.mybatisplus.extension.service.IService;
import net._1di.piproserver.entity.File;

import javax.print.Doc;
import java.io.IOException;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface IDocumentService extends IService<Document> {

    /**
     * 保存一个文档
     * @param  createDocumentVo 文档封装类
     * @return
     */
    boolean saveDocument(CreateDocumentVo createDocumentVo) ;

    /**
     * 获取合法的文档
     * 获取合法的文件
     * 如果文件不合法，返回空
     * 如果文件父目录不合法，或者父目录的父目录不合法，返回空
     * @param documentId
     * @return
     */
    Document getValidDocument(String documentId);

    /**
     * 就是把Document的状态设置成DELETE
     * @param deleteDocumentVo
     * @return
     */
    boolean deleteFile(DeleteDocumentVo deleteDocumentVo);

    /**
     * 更新文档
     * @param updateDocumentVo
     * @return
     */
    boolean updateDocument(UpdateDocumentVo updateDocumentVo);
}
