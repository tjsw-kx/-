package com.graduation.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.graduation.mapper.ChatRoomDao;
import com.graduation.model.ChatRoomEntity;
import com.graduation.service.ChatRoomService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 聊天室
 * @author x--man
 * @date 2020-11-02 16:54:39
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ChatRoomServiceImpl extends ServiceImpl<ChatRoomDao, ChatRoomEntity> implements ChatRoomService {
}