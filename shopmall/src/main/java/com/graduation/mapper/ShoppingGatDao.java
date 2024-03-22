package com.graduation.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.model.ShoppingGatEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 购物车
 * @author x--man
 * @date 2020-03-06 19:01:59
 */
@Mapper
public interface ShoppingGatDao extends BaseMapper<ShoppingGatEntity> {
}