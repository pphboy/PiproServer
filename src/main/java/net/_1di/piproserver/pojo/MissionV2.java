package net._1di.piproserver.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import net._1di.piproserver.entity.Label;
import net._1di.piproserver.entity.Member;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Accessors(chain = true)
public class MissionV2 implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("任务标识")
    private String missionId;
    @ApiModelProperty("列表标识")
    private Integer kanbanListId;

    private Integer projectId;

    private String projectName;

    @TableField(exist = false)
    private List<Member> memberList;

    @TableField(exist = false)
    private List<Label> labelList;

    @ApiModelProperty("任务名")
    private String missionTitle;

    @ApiModelProperty("任务介绍")
    private String missionIntro;

    @ApiModelProperty("任务排序")
    private Integer missionOrder;

    @ApiModelProperty("结束时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;

}
