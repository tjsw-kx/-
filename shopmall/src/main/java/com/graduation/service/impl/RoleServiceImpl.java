package com.graduation.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.graduation.entity.RoleEntity;
import com.graduation.mapper.RoleDao;
import com.graduation.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 角色表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl extends ServiceImpl<RoleDao, RoleEntity> implements RoleService{
}