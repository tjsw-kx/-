package com.graduation.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.entity.TuijianEntity;

@Mapper
public interface TuiJianDao extends BaseMapper<TuijianEntity> {

	@Select("delete from tuijian")
	void deleTuijian();
	
}