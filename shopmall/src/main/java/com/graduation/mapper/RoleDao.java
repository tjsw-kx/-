package com.graduation.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.entity.RoleEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Mapper
public interface RoleDao extends BaseMapper<RoleEntity> {
}