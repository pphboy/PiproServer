package net._1di.piproserver.component;

import com.baomidou.mybatisplus.core.incrementer.IdentifierGenerator;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicLong;

@Component
@Slf4j
public class CustomIdGenerator {
//        implements IdentifierGenerator {
//    private final AtomicLong al = new AtomicLong(1);
//
//    @Override
//    public Long nextId(Object entity) {
//        //可以将当前传入的class全类名来作为bizKey,或者提取参数来生成bizKey进行分布式Id调用生成.
//        String bizKey = entity.getClass().getName();
//        MetaObject metaObject = SystemMetaObject.forObject(entity);
//        String name = (String)metaObject.getValue("memberName");
//        //根据bizKey调用分布式ID生成
//        long id =al.getAndAdd(1);
//        log.info("{} => {}",name,id);
//        //返回生成的id值即可.
//        return id;
//    }

}