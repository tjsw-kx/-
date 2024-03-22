package com.graduation.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.graduation.mapper.XinwenDao;
import com.graduation.model.XinwenEntity;
import com.graduation.service.XinwenService;

@Service
@Transactional(rollbackFor = Exception.class)
public class XinwenServiceImpl extends ServiceImpl<XinwenDao, XinwenEntity> implements XinwenService{
}