package com.graduation.service.impl;

import com.graduation.mapper.OrderCommentDao;
import com.graduation.model.OrderCommentEntity;
import com.graduation.service.OrderCommentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单评价表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrderCommentServiceImpl extends ServiceImpl<OrderCommentDao,OrderCommentEntity> implements OrderCommentService{
}