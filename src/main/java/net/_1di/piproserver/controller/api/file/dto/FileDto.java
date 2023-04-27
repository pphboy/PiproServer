package net._1di.piproserver.controller.api.file.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import net._1di.piproserver.entity.Member;
import org.springframework.web.multipart.MultipartFile;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.controller.api.file.vo
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  11:49
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class FileDto {
    private Integer projectId;
    private Member member;
    private Integer directoryId;
    private MultipartFile file;
}
