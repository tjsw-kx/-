package com.graduation.service.impl;

import com.graduation.mapper.ShoppingGatDao;
import com.graduation.model.ShoppingGatEntity;
import com.graduation.service.ShoppingGatService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 购物车
 * @author x--man
 * @date 2020-03-06 19:01:59
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ShoppingGatServiceImpl extends ServiceImpl<ShoppingGatDao,ShoppingGatEntity> implements ShoppingGatService{
}