package com.bdqn.bbh_zy.controller;

import com.alibaba.fastjson.JSONArray;
import com.bdqn.bbh_zy.entity.Room;
import com.bdqn.bbh_zy.entity.User;
import com.bdqn.bbh_zy.mapper.RoomMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoomController {

    @Resource
    private RoomMapper roomMapper;

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,Room room,
                       Model model) {

        PageHelper.startPage(pageNum,2);
        List<Room> roomList=roomMapper.roomList(room);
        PageInfo<Room> pageInfo=new PageInfo<Room>(roomList);
        model.addAttribute("pageInfo",pageInfo);
        return "roomManagement";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(Model model,@RequestParam(value = "id")Integer id) {
        Room room = roomMapper.selectRoomById(id);
        List<User> list = roomMapper.userList(id);
        model.addAttribute("list", list);
        model.addAttribute("room", room);
        return "updateRoom";
    }

    @RequestMapping("/update")
    public String update() {
        return "";
    }
//    @RequestMapping("/add")
//    public String add(Room room) {
//
//
//    }
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "add";
    }
public String add(Room room){
    int i = 0;
    if (room != null) {
        i = roomMapper.insert(room);
    }
    if (i > 0) {
        return "redirect:/list";
    }
        return "/add";
}
    @RequestMapping("/delete")
    @ResponseBody
public String delete(@RequestParam(value = "id")Integer id){
    Map<String,String> resultMap=new HashMap<String,String>();
    if (roomMapper.deleteByPrimaryKey(id)>0){
        resultMap.put("result","success");
    }else {
        resultMap.put("result","failure");
    }
    return JSONArray.toJSONString(resultMap);
}
    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(@RequestParam(value = "id")Integer id){
        Map<String,String> resultMap=new HashMap<String,String>();
        if (roomMapper.deleteByPrimaryKey(id)>0){
            resultMap.put("result","success");
        }else {
            resultMap.put("result","failure");
        }
        return JSONArray.toJSONString(resultMap);
    }
}