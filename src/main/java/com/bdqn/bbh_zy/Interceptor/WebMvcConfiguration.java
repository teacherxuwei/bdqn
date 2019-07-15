package com.bdqn.bbh_zy.Interceptor;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    private final Logger logger = LoggerFactory.getLogger(WebMvcConfiguration.class);

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        logger.info("add interceptors");
        registry.addInterceptor(new LoginRequiredInterceptor()).excludePathPatterns(Arrays.asList("/static/**"));
    }

    public void addResourceHandlers(ResourceHandlerRegistry registry){
        logger.info("add resourceHandlers");
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }E:\实战项目\spring-boot-examples\bbh_zy\src\main\resources\application.yml
}
