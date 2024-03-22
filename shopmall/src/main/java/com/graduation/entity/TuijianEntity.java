package com.graduation.entity;

import com.baomidou.mybatisplus.annotations.TableName;

import lombok.Data;

@Data
@TableName("tuijian")
public class TuijianEntity extends BaseEntity {
	private String userid;
	private String goodid;

}
