package com.graduation.model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;
import com.graduation.entity.BaseEntity;
import lombok.Data;
import com.graduation.table.ShopTable;
import java.math.BigDecimal;


/**
 * 商品表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Data
@TableName("shop")
public class ShopEntity extends BaseEntity{
  /**
   * 商品名称
   */
  @TableField(ShopTable.NAME)
  private String name;
  /**
   * 简单描述
   */
  @TableField(ShopTable.SUMMERY)
  private String summery;
  /**
   * 内容
   */
  @TableField(ShopTable.CONTENT)
  private String content;
  /**
   * 类型ID
   */
  @TableField(ShopTable.TYPE_ID)
  private String typeId;
  /**
   * 封面
   */
  @TableField(ShopTable.COVER)
  private String cover;
  /**
   * 
   */
  @TableField(ShopTable.PRICE)
  private BigDecimal price;
  /**
   * 折扣价格
   */
  @TableField(ShopTable.DISCOUNT_PRICE)
  private BigDecimal discountPrice;
  /**
   * 评分
   */
  @TableField(ShopTable.SCORE)
  private Double score;
  /**
   * 库存剩余
   */
  @TableField(ShopTable.STOCK)
  private Integer stock;

  private Boolean status;

  private boolean hot;

  private String label;

  private BigDecimal royalty;
}
