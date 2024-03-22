package com.graduation.service.impl;

import com.graduation.mapper.OrderDao;
import com.graduation.model.OrderEntity;
import com.graduation.service.OrderService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrderServiceImpl extends ServiceImpl<OrderDao,OrderEntity> implements OrderService{
}