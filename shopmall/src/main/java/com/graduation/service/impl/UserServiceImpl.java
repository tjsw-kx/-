package com.graduation.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.graduation.entity.UserEntity;
import com.graduation.mapper.UserDao;
import com.graduation.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements UserService{
}