package com.graduation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.model.ShopEntity;

/**
 * 商品表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Mapper
public interface ShopDao extends BaseMapper<ShopEntity> {
	
	
	@Select("SELECT id FROM `shop` WHERE id IN (SELECT shop_id FROM `order_shop` WHERE customer_id=#{userid} GROUP BY shop_id)")
	List<ShopEntity> findAll(String userid);
}