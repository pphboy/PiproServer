package net._1di.piproserver.annotations.valid;

import org.apache.commons.lang3.StringUtils;

import javax.validation.Constraint;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.util.Objects;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.annotations.valid
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-23  10:44
 */
@Target({FIELD, PARAMETER})
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = {InValues.InValuesValidator.class})
public @interface InValues {

    String message() default "value must be in {values}";

    String[] values();

    // 是否可以为空，默认为空，为空值则检查通过
    boolean canNull() default true;

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    // 指定多个时使用
    @Target({FIELD, PARAMETER})
    @Retention(RUNTIME)
    @Documented
    @interface List {
        InValues[] value();
    }

    // 自定义检查逻辑
    class InValuesValidator implements ConstraintValidator<InValues, Object> {
        private String[] values;
        private boolean canNull;

        @Override
        public void initialize(InValues constraintAnnotation) {
            values = constraintAnnotation.values();
            canNull = constraintAnnotation.canNull();
        }

        @Override
        public boolean isValid(Object value, ConstraintValidatorContext context) {
            if (Objects.nonNull(value)) {
                for (String item : values) {
                    if (StringUtils.equals(item, String.valueOf(value))) {
                        return Boolean.TRUE;
                    }
                }
                return Boolean.FALSE;
            }
            return canNull;
        }
    }
}

