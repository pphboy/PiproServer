package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.Document;
import net._1di.piproserver.mapper.DocumentMapper;
import net._1di.piproserver.service.IDocumentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

}
