package net._1di.piproserver.utils;

import org.apache.commons.lang3.time.FastDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.util.DateUtils;

import java.io.File;
import java.io.IOException;

/**
 * @BelongsProject: PiPROServer
 * @BelongsPackage: net._1di.piproserver.utils
 * @Author: pphboy@qq.com
 * @Description: 介绍
 * @CreateTime: 2023-04-27  10:42
 */
@Component
public class FileUtil {

    @Value("${filepath}")
    String filepath;

    @Autowired
    UUIDUtil uuidUtil;

    /**
     *
     * @param multipartFile
     * @return UUID
     * @throws IOException
     */
    public String saveMultipartFile(MultipartFile multipartFile) throws IOException {
        String originalFilename = multipartFile.getOriginalFilename();
        String path = FastDateFormat.getInstance("yyyy/MM/dd").format(System.currentTimeMillis());
        File dir = new File(filepath+path);
        if(!dir.exists()){
            dir.mkdirs();
        }
        // 做一个文件格式
        String relativeFilePath = String.format("/%s/%s.%s",
                path,
                uuidUtil.uuid(),
                originalFilename.substring(originalFilename.lastIndexOf(".")+1)
                );

        File file = new File(filepath+relativeFilePath);
        file.createNewFile();
        FileCopyUtils.copy(multipartFile.getBytes(),file);
        return relativeFilePath;
    }

    /**
     * 上传文件，带PROJECTID的
     * @param multipartFile
     * @param projectId
     * @return
     * @throws IOException
     */
    public String saveMultipartFile(MultipartFile multipartFile,Integer projectId) throws IOException {
        String originalFilename = multipartFile.getOriginalFilename();
        String path = String.format("/project_%d/%s",projectId,FastDateFormat.getInstance("yyyy/MM/dd").format(System.currentTimeMillis()));
        File dir = new File(filepath+path);
        if(!dir.exists()){
            dir.mkdirs();
        }
        // 做一个文件格式
        String relativeFilePath = String.format("%s/%s.%s",
                path,
                uuidUtil.uuid(),
                originalFilename.substring(originalFilename.lastIndexOf(".")+1)
        );

        File file = new File(filepath+relativeFilePath);
        file.createNewFile();
        FileCopyUtils.copy(multipartFile.getBytes(),file);
        return relativeFilePath;
    }
}
