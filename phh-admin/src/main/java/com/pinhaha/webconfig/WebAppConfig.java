package com.pinhaha.webconfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class WebAppConfig extends WebMvcConfigurerAdapter  {

//	@Bean
//	public PasswordEncoder passwordEncoder() {
//
//		return new BCryptPasswordEncoder();
//
//	}
	@Bean // 把我们的拦截器注入为bean
	public HandlerInterceptor getFirstInterceptor() {

		return new FirstInterceptor();
	}
	
	

	@Bean // 注入拦截器
	public HandlerInterceptor getAdminInterceptor() {
		return new AdminInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 注册自定义拦截器，添加拦截路径和排除拦截路径
		String[] list = {  "/user/**","/login/**","/checkAdmin","/error/**","/userapi/login","/userapi/uploadImg","/userapi/createImageTemp","/userapi/uploadSoldierImg" };
		registry.addInterceptor(getFirstInterceptor()).addPathPatterns("/**");
		registry.addInterceptor(getAdminInterceptor()).addPathPatterns("/**").excludePathPatterns(list);
	}
	
	 /**
     * 配置静态访问资源
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        super.addResourceHandlers(registry);
    }
}
