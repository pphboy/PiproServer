package net._1di.piproserver.controller.api.project.kanban.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.Set;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.project.kanban.vo
 * @Author: pphboy@qq.com
 * @CreateTime: 2023-04-23  14:55
 */
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "MissionView对象")
public class MissionVo {

    private String missionId;

    @ApiModelProperty("列表标识")
    @NotNull(message = "列表必须存在")
    private Integer kanbanListId;

    @ApiModelProperty("任务名")
    @NotEmpty(message = "任务名不能为空")
    private String missionTitle;

    @ApiModelProperty("任务介绍")
    private String missionIntro;

    @ApiModelProperty("开始时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    @ApiModelProperty("结束时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;

    /**
     * 这里有很多问题
     * 比如说重复，什么的。
     * 这种功能我还是先放下
     * Set 去重
     */
    @ApiModelProperty("标签列表")
    private Set<Integer> labelList;
    @ApiModelProperty("人员列表")
    private Set<Integer> memberList;

}
