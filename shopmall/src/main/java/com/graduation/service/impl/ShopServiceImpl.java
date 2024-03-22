package com.graduation.service.impl;

import com.graduation.mapper.ShopDao;
import com.graduation.model.ShopEntity;
import com.graduation.service.ShopService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 商品表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ShopServiceImpl extends ServiceImpl<ShopDao,ShopEntity> implements ShopService{
}