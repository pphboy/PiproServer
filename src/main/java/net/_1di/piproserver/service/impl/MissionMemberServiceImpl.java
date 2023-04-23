package net._1di.piproserver.service.impl;

import net._1di.piproserver.entity.MissionMember;
import net._1di.piproserver.mapper.MissionMemberMapper;
import net._1di.piproserver.service.IMissionMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 参与任务 服务实现类
 * </p>
 *
 * @author pphboy
 * @since 2023-04-23
 */
@Service
public class MissionMemberServiceImpl extends ServiceImpl<MissionMemberMapper, MissionMember> implements IMissionMemberService {

}
