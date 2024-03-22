package com.graduation.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.graduation.entity.BaseEntity;
import com.graduation.table.ChatRoomTable;
import lombok.Data;

import java.util.Date;


/**
 * 聊天室
 * @author x--man
 * @date 2020-11-02 16:54:39
 */
@Data
@TableName("chat_room")
public class ChatRoomEntity extends BaseEntity {
  /**
   * 用户ID
   */
  @TableField(ChatRoomTable.USER_ID)
  private String userId;
  /**
   * 系统的用户ID
   */
  @TableField(ChatRoomTable.ASSIST_USER_ID)
  private String assistUserId;
  /**
   * 时间
   */
  @TableField(ChatRoomTable.TIME)
  private Date time;
  /**
   * 内容
   */
  @TableField(ChatRoomTable.CONTENT)
  private String content;
  /**
   * 内容详情  1 文字  2 图片  3视频  4文件
   */
  @TableField(ChatRoomTable.CONTENT_TYPE)
  private Integer contentType;
  /**
   * 消息是否已读
   */
  @TableField(ChatRoomTable.READ)
  private Boolean read;
  /**
   * 发送者id
   */
  @TableField(ChatRoomTable.SEND_USER)
  private String sendUser;

  @TableField(exist = false)
  private Boolean br;
}
