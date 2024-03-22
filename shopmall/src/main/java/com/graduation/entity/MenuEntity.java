package com.graduation.entity;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;
import com.graduation.table.MenuTable;
import java.util.Date;
import java.util.List;


/**
 * 菜单表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Data
@TableName("menu")
public class MenuEntity extends BaseEntity{
  /**
   * 菜单名
   */
  @TableField(MenuTable.NAME)
  private String name;
  /**
   * 请求地址
   */
  @TableField(MenuTable.URL)
  private String url;
  /**
   * 1级菜单  2级菜单
   */
  @TableField(MenuTable.TYPE)
  private Integer type;
  /**
   * 父级ID
   */
  @TableField(MenuTable.P_ID)
  private String pId;
  /**
   * 添加时间
   */
  @TableField(MenuTable.TIME)
  private Date time;

  @TableField(exist = false)
  private boolean auth;

  @TableField(exist = false)
  private List<MenuEntity> childs;
}
