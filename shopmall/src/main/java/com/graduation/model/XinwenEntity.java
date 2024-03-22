package com.graduation.model;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.graduation.entity.BaseEntity;
import com.graduation.table.OrderTable;

import lombok.Data;

@Data
@TableName("`xinwen`")
public class XinwenEntity extends BaseEntity{
  @TableField(OrderTable.TIME)
  private Date time;
  private String name;
  private String content;
}
