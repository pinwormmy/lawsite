package com.study.column;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(value={"com.study.column.mapper"})
@SpringBootApplication
public class GamepinApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(GamepinApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder applicationBuilder) {
		return applicationBuilder.sources(ServletInitializer.class);
	}

}
