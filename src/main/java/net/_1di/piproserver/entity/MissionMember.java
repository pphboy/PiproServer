package net._1di.piproserver.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * <p>
 * 参与任务
 * </p>
 *
 * @author pphboy
 * @since 2023-04-23
 */
@Getter
@Setter
@TableName("pi_mission_member")
@ApiModel(value = "MissionMember对象", description = "参与任务")
@AllArgsConstructor
@NoArgsConstructor
public class MissionMember implements Serializable {

    private static final long serialVersionUID = 1L;


    public MissionMember(String missionId, Integer memberId) {
        this.missionId = missionId;
        this.memberId = memberId;
    }

    @ApiModelProperty("任务标识")
    private String missionId;
    @ApiModelProperty("任务标识")
    private Integer memberId;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
