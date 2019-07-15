package com.bdqn.bbh_zy;

import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.bdqn.bbh_zy.mapper")
public class BbhZyApplication {

    public static void main(String[] args) {
        SpringApplication.run(BbhZyApplication.class, args);
    }

}
