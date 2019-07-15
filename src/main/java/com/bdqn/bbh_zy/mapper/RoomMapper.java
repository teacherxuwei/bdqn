package com.bdqn.bbh_zy.mapper;

import com.bdqn.bbh_zy.entity.Room;
import com.bdqn.bbh_zy.entity.User;

import java.util.List;

public interface RoomMapper {
    List<Room> roomList(Room room);
    List<User> userList(Integer id);
    Room selectRoomById(Integer id);
    int deleteByPrimaryKey(Integer id);
    int deleteByUserId(Integer id);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bbh_room_room
     *
     * @mbggenerated
     */
    int insert(Room record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bbh_room_room
     *
     * @mbggenerated
     */
    int insertSelective(Room record);
}