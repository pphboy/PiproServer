package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.controller.api.document.vo.CreateDocumentVo;
import net._1di.piproserver.controller.api.document.vo.DeleteDocumentVo;
import net._1di.piproserver.controller.api.document.vo.UpdateDocumentVo;
import net._1di.piproserver.entity.Document;
import net._1di.piproserver.enums.FileStatus;
import net._1di.piproserver.mapper.DocumentMapper;
import net._1di.piproserver.service.IDocumentDirectoryService;
import net._1di.piproserver.service.IDocumentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
public class DocumentServiceImpl extends ServiceImpl<DocumentMapper, Document> implements IDocumentService {
    @Autowired
    IDocumentDirectoryService documentDirectoryService;

    @Override
    public boolean saveDocument(CreateDocumentVo createDocumentVo){
        return save(new Document(createDocumentVo.getDirectoryId()
                ,createDocumentVo.getDocumentTitle()
                ,createDocumentVo.getDocumentContent()));
    }

    @Override
    public Document getValidDocument(String documentId) {
        Document validDocument = getOne(new QueryWrapper<Document>().lambda()
                .eq(Document::getDocumentId, documentId)
                .ge(Document::getFileStatus, FileStatus.DEFAULT.value));
        if(ObjectUtils.isEmpty(documentDirectoryService.getValidDirectory(validDocument.getDocumentDirectoryId()))) return null;
        return validDocument;
    }

    @Override
    public boolean deleteFile(DeleteDocumentVo deleteDocumentVo) {
        return updateById(new Document(deleteDocumentVo.getDocumentId(),FileStatus.DELETE.value));
    }

    @Override
    public boolean updateDocument(UpdateDocumentVo updateDocumentVo) {
        return updateById(new Document(updateDocumentVo.getDocumentId(),updateDocumentVo.getDocumentTitle(),updateDocumentVo.getDocumentContent()));
    }
}
