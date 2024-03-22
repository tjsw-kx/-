package com.graduation.service.impl;

import com.graduation.mapper.OrderShopDao;
import com.graduation.model.OrderShopEntity;
import com.graduation.service.OrderShopService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单购物详情
 * @author x--man
 * @date 2020-03-06 19:01:59
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrderShopServiceImpl extends ServiceImpl<OrderShopDao,OrderShopEntity> implements OrderShopService{
}