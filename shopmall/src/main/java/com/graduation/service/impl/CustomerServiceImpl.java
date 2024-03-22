package com.graduation.service.impl;

import com.graduation.mapper.CustomerDao;
import com.graduation.model.CustomerEntity;
import com.graduation.service.CustomerService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 客户表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CustomerServiceImpl extends ServiceImpl<CustomerDao,CustomerEntity> implements CustomerService{
}