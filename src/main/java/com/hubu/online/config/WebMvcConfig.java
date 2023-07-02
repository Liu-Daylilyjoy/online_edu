package com.hubu.online.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.FormContentFilter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * WebMvc配置, 拦截器、资源映射等都在此配置
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    /**
     * 上传文件路径-映射
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //如果是Windows系统
        registry.addResourceHandler("http://rwxu06s4o.hd-bkt.clouddn.com/**").addResourceLocations("/img/");
    }

    /**
     * 支持跨域访问
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**").maxAge(3600)
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("Content-Type", "x-requested-with", "X-Custom-Header", "Authorization");
    }

    /**
     * 支持PUT、DELETE请求
     */
    @Bean
    public FormContentFilter httpPutFormContentFilter() {
        return new FormContentFilter();
    }
}