package com.graduation.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.graduation.entity.RoleMenuEntity;
import com.graduation.mapper.RoleMenuDao;
import com.graduation.service.RoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 角色菜单表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuDao, RoleMenuEntity> implements RoleMenuService{
}