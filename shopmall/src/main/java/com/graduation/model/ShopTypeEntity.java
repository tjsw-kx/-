package com.graduation.model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;
import com.graduation.entity.BaseEntity;
import lombok.Data;
import com.graduation.table.ShopTypeTable;


/**
 * 商品类型
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Data
@TableName("shop_type")
public class ShopTypeEntity extends BaseEntity{
  /**
   * 名称
   */
  @TableField(ShopTypeTable.NAME)
  private String name;
}
