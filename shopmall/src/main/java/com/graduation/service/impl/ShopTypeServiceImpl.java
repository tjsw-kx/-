package com.graduation.service.impl;

import com.graduation.mapper.ShopTypeDao;
import com.graduation.model.ShopTypeEntity;
import com.graduation.service.ShopTypeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 商品类型
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ShopTypeServiceImpl extends ServiceImpl<ShopTypeDao,ShopTypeEntity> implements ShopTypeService{
}