package com.bdqn.bbh_zy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
    @ResponseBody
    @RequestMapping
    public String hello() {
        return "hello";
    }

    @RequestMapping("/hello2")
    public String hello2(){
        return "hello2";
    }
}
