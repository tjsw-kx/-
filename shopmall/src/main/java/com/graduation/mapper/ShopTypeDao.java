package com.graduation.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.model.ShopTypeEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品类型
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Mapper
public interface ShopTypeDao extends BaseMapper<ShopTypeEntity> {
}