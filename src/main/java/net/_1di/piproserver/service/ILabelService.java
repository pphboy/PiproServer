package net._1di.piproserver.service;

import net._1di.piproserver.entity.Label;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface ILabelService extends IService<Label> {


    public List<Label> getLabelListByProjectId(Integer projectId);
}
