package com.graduation.entity;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;
import com.graduation.table.RoleMenuTable;


/**
 * 角色菜单表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Data
@TableName("role_menu")
public class RoleMenuEntity extends BaseEntity{
  /**
   * 角色ID
   */
  @TableField(RoleMenuTable.ROLE_ID)
  private String roleId;
  /**
   * 菜单ID
   */
  @TableField(RoleMenuTable.MENU_ID)
  private String menuId;
}
