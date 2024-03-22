package com.graduation.service.impl;

import com.graduation.mapper.CustomerAddressDao;
import com.graduation.model.CustomerAddressEntity;
import com.graduation.service.CustomerAddressService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 客户收货地址
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CustomerAddressServiceImpl extends ServiceImpl<CustomerAddressDao,CustomerAddressEntity> implements CustomerAddressService{
}