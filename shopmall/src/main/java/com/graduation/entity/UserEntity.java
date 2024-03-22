package com.graduation.entity;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;
import com.graduation.table.UserTable;
import java.util.Date;


/**
 * 用户表
 * @author resource_sharing
 * @date 2019-12-31 11:38:39
 */
@Data
@TableName("user")
public class UserEntity extends BaseEntity{
  /**
   * 用户名  昵称 
   */
  @TableField(UserTable.NAME)
  private String name;
  /**
   * 登录名
   */
  @TableField(UserTable.LOGIN_NAME)
  private String loginName;
  /**
   * 登录密码
   */
  @TableField(UserTable.PASSWORD)
  private String password;
  /**
   *  性别  1男  2女
   */
  @TableField(UserTable.SEX)
  private Boolean sex;
  /**
   * 手机号码
   */
  @TableField(UserTable.PHONE)
  private String phone;
  /**
   * 个人介绍
   */
  @TableField(UserTable.MARK)
  private String mark;
  /**
   * 头像地址
   */
  @TableField(UserTable.HEAD_IMG)
  private String headImg;
  /**
   * 1 启用  0 禁用
   */
  @TableField(UserTable.STATUS)
  private Boolean status;
  /**
   * 角色ID
   */
  @TableField(UserTable.ROLE_ID)
  private String roleId;
  /**
   * 添加时间
   */
  @TableField(UserTable.TIME)
  private Date time;


  @TableField(value="role_name",exist = false)
  private String roleName;
}
