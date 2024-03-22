package com.graduation.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.graduation.model.ChatRoomEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;


/**
 * 聊天室
 * @author x--man
 * @date 2020-11-02 16:54:39
 */
@Mapper
public interface ChatRoomDao extends BaseMapper<ChatRoomEntity> {

    /**
     * 查询列表
     * @return
     */
    @Select("SELECT * FROM customer\t\n" +
            "\tLEFT JOIN\n" +
            "(SELECT user_id,SUM(IF(`read` = 0,1,0)) no_read_num FROM chat_room WHERE send_user != '-99' GROUP BY user_id )A\n" +
            "ON customer.id = A.user_id  ORDER BY A.no_read_num")
    List<Map<String,Object>> list();

    /**
     * 阅读
     * @param userId
     */
    @Update("update chat_room set `read` = 1 where user_id = #{userId}")
    void read(@Param("userId") String userId);


}