package com.graduation.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.model.OrderEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Mapper
public interface OrderDao extends BaseMapper<OrderEntity> {
}