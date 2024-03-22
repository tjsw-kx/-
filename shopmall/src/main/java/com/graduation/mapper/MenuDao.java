package com.graduation.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.entity.MenuEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 菜单表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Mapper
public interface MenuDao extends BaseMapper<MenuEntity> {

    /**
     * 查询角色的菜单
     * @param roleId
     * @return
     */
    @Select("select * from menu where id in (select menu_id from role_menu where role_id = #{roleId})")
    List<MenuEntity> selectByRoleId(@Param("roleId") String roleId);
}