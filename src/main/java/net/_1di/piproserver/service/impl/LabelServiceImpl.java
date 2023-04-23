package net._1di.piproserver.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net._1di.piproserver.entity.Label;
import net._1di.piproserver.mapper.LabelMapper;
import net._1di.piproserver.service.ILabelService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
@Service
public class LabelServiceImpl extends ServiceImpl<LabelMapper, Label> implements ILabelService {

    @Override
    public List<Label> getLabelListByProjectId(Integer projectId) {
        return list(new QueryWrapper<Label>().lambda().eq(Label::getProjectId,projectId));
    }
}
