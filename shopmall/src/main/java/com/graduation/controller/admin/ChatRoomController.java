package com.graduation.controller.admin;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.graduation.config.Contants;
import com.graduation.config.Result;
import com.graduation.mapper.ChatRoomDao;
import com.graduation.model.ChatRoomEntity;
import com.graduation.service.ChatRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("chatRoom")
public class ChatRoomController {

    @Autowired
    private ChatRoomDao chatRoomDao;

    @Autowired
    private ChatRoomService chatRoomService;

    @PostMapping("listkk.html")
    public Result listkk()throws Exception{
        List<Map<String,Object>> l =  chatRoomDao.list();
        return Result.success(l);
    }


    /**
     * 阅读
     * @return
     * @throws Exception
     */
    @PostMapping("read.html")
    public Result read(String userId)throws Exception{
        chatRoomDao.read(userId);
        return Result.success("已阅读");
    }

    /**
     * 消息列表
     * @return
     */
    @RequestMapping("list.html")
    public Result listx(String userId){
        //首先查询帮助信息
        EntityWrapper entityWrapper = new EntityWrapper();
        //消息列表
        entityWrapper
                .eq("user_id",userId)
                .orderBy("time",true);
        List<ChatRoomEntity> list = chatRoomService.selectList(entityWrapper);
        for (ChatRoomEntity chatRoomEntity : list) {
            chatRoomEntity.setBr(chatRoomEntity.getSendUser().equals("-99"));
        }
        chatRoomDao.read(userId);
        return Result.success(list);
    }

    /**
     * 发送消息
     * @param chatRoomEntity
     * @return
     */
    @RequestMapping("addContent.html")
    public Result addContentHtml(ChatRoomEntity chatRoomEntity){
        //首先查询帮助信息
        chatRoomEntity.setId(IdWorker.get32UUID());
        chatRoomEntity.setRead(false);
        chatRoomEntity.setSendUser("-99");
        chatRoomEntity.setAssistUserId("-99");
        chatRoomEntity.setTime(new Date());
        chatRoomService.insert(chatRoomEntity);
        return Result.success("发送成功");
    }




    @PostMapping("list.do")
    public Result list()throws Exception{
        //首先查询帮助信息
        EntityWrapper entityWrapper = new EntityWrapper();
        //消息列表
        entityWrapper
                .eq("user_id", Contants.getCustomer().getId())
                .orderBy("time",true);
        List<ChatRoomEntity> list = chatRoomService.selectList(entityWrapper);
        for (ChatRoomEntity chatRoomEntity : list) {
            chatRoomEntity.setBr(chatRoomEntity.getSendUser().equals(Contants.getCustomer().getId()));
        }
        return Result.success(list);
    }


    /**
     * 发送消息
     * @param chatRoomEntity
     * @return
     */
    @RequestMapping("addContent.do")
    public Result addContent(ChatRoomEntity chatRoomEntity){
        //首先查询帮助信息
        chatRoomEntity.setId(IdWorker.get32UUID());
        chatRoomEntity.setRead(false);
        chatRoomEntity.setSendUser(Contants.getCustomer().getId());
        chatRoomEntity.setUserId(Contants.getCustomer().getId());
        chatRoomEntity.setAssistUserId("-99");
        chatRoomEntity.setTime(new Date());
        chatRoomService.insert(chatRoomEntity);
        return Result.success("发送成功");
    }
}
