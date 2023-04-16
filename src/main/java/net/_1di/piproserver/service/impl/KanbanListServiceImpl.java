package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.KanbanList;
import net._1di.piproserver.mapper.KanbanListMapper;
import net._1di.piproserver.service.IKanbanListService;
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
public class KanbanListServiceImpl extends ServiceImpl<KanbanListMapper, KanbanList> implements IKanbanListService {

}
