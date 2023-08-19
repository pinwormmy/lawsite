package com.sc1hub;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(value = {"com.study.column.mapper"})
@SpringBootApplication
public class SC1HubApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SC1HubApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder applicationBuilder) {
        return applicationBuilder.sources(ServletInitializer.class);
    }

}
