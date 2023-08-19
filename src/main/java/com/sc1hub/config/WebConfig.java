package com.sc1hub.config;

import com.sc1hub.interceptor.AdminInterceptor;
import com.sc1hub.interceptor.VisitorCountInterceptor;
import com.sc1hub.visitorCount.VisitorCountService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@Slf4j
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    VisitorCountService visitorCountService;

    @Value("/img/**")
    private String connectPath;

    // 로컬이랑 온라인 절대경로 차이 생김 '끝에 /'
    @Value("${path.upload.img}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.debug("업로드 컨피그 작동 확인 연결경로 : {}", connectPath);
        log.debug("업로드 컨피그 작동 확인 파일경로 : {}", uploadPath);
        registry.addResourceHandler(connectPath)
                .addResourceLocations(uploadPath);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new VisitorCountInterceptor(visitorCountService))
                .addPathPatterns("/**");
        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns("/**/writePost/**", "/**/modifyPost/**");
    }

}
