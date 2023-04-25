package net._1di.piproserver.mapper;

import net._1di.piproserver.entity.ProjectMission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net._1di.piproserver.pojo.MissionV2;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author pphboy
 * @since 2023-04-16
 */
public interface ProjectMissionMapper extends BaseMapper<ProjectMission> {

    /**

     SELECT
     pmm.*,
     pi_project.project_name
     FROM
     (
     SELECT
     mission_id,
     ppm.kanban_list_id,
     mission_title,
     end_time,
     mission_order,
     kab.project_id
     FROM
     pi_project_mission ppm
     LEFT JOIN (
     SELECT
     pkl.list_name,
     pkl.kanban_list_id,
     project_id
     FROM
     pi_kanban_list pkl
     WHERE
     pkl.project_id IN ( SELECT project_id pid FROM pi_project_members WHERE member_id = #{memberId} AND project_authority >= 0 # 用户在项目中的权限
     )
     AND kanban_status = 0 #看板状态为默认

     ) kab ON ppm.kanban_list_id = kab.kanban_list_id
     WHERE
     mission_id IN ( SELECT mission_id FROM pi_mission_member WHERE member_id = #{memberId} )
     AND mission_status = 0 # 任务状态为可用

     ) pmm
     LEFT JOIN pi_project ON pi_project.project_id = pmm.project_id
     WHERE
     pi_project.project_status >= 0 # 项目默认状态为可用
     * @param memberId
     * @return
     */
    @Select("SELECT\n" +
            "\tpmm.*,\n" +
            "\tpi_project.project_name \n" +
            "FROM\n" +
            "\t(\n" +
            "\tSELECT\n" +
            "\t\tmission_id,\n" +
            "\t\tppm.kanban_list_id,\n" +
            "\t\tmission_title,\n" +
            "\t\tend_time,\n" +
            "\t\tmission_order,\n" +
            "\t\tkab.project_id \n" +
            "\tFROM\n" +
            "\t\tpi_project_mission ppm\n" +
            "\t\tLEFT JOIN (\n" +
            "\t\tSELECT\n" +
            "\t\t\tpkl.list_name,\n" +
            "\t\t\tpkl.kanban_list_id,\n" +
            "\t\t\tproject_id \n" +
            "\t\tFROM\n" +
            "\t\t\tpi_kanban_list pkl \n" +
            "\t\tWHERE\n" +
            "\t\t\tpkl.project_id IN ( SELECT project_id pid FROM pi_project_members WHERE member_id = #{memberId} AND project_authority >= 0 # 用户在项目中的权限\n" +
            "\t\t\t) \n" +
            "\t\t\tAND kanban_status = 0 #看板状态为默认\n" +
            "\t\t\t\n" +
            "\t\t) kab ON ppm.kanban_list_id = kab.kanban_list_id \n" +
            "\tWHERE\n" +
            "\t\tmission_id IN ( SELECT mission_id FROM pi_mission_member WHERE member_id = #{memberId} ) \n" +
            "\t\tAND mission_status = 0 # 任务状态为可用\n" +
            "\t\t\n" +
            "\t) pmm\n" +
            "\tLEFT JOIN pi_project ON pi_project.project_id = pmm.project_id \n" +
            "WHERE\n" +
            "\tpi_project.project_status >= 0 # 项目默认状态为可用")
    List<MissionV2> getMissionsByMemberId(Integer memberId);
}
