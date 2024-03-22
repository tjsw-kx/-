package com.graduation.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.model.CustomerEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 客户表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Mapper
public interface CustomerDao extends BaseMapper<CustomerEntity> {
}