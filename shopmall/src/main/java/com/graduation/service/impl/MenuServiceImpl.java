package com.graduation.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.graduation.entity.MenuEntity;
import com.graduation.mapper.MenuDao;
import com.graduation.service.MenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 菜单表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MenuServiceImpl extends ServiceImpl<MenuDao, MenuEntity> implements MenuService{
}