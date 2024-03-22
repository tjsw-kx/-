package com.graduation.model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;
import com.graduation.entity.BaseEntity;
import lombok.Data;
import com.graduation.table.OrderTable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * 订单表
 * @author x--man
 * @date 2020-03-06 10:49:36
 */
@Data
@TableName("`order`")
public class OrderEntity extends BaseEntity{
  /**
   * 
   */
  @TableField(OrderTable.PRICE)
  private BigDecimal price;
  /**
   * 1 已购买 2 已发货  3已收货  4 已评价
   */
  @TableField(OrderTable.STATUS)
  private Integer status;
  /**
   * 
   */
  @TableField(OrderTable.TIME)
  private Date time;
  /**
   * 地址
   */
  @TableField(OrderTable.ADDRESS)
  private String address;
  /**
   * 收货人
   */
  @TableField(OrderTable.NAME)
  private String name;
  /**
   * 电话
   */
  @TableField(OrderTable.PHONE)
  private String phone;
  /**
   * 客户ID
   */
  @TableField(OrderTable.CUSTOMER_ID)
  private String customerId;
  private String tousu;
  private String tstime;

  @TableField(exist = false)
  private List<OrderShopEntity> orderShops;
}
