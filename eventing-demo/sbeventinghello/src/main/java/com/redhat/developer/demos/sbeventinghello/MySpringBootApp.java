package com.redhat.developer.demos.sbeventinghello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class MySpringBootApp {

  // Register Servlet
  @Bean
  public ServletRegistrationBean servletRegistrationBean() {
      final ServletRegistrationBean bean = new ServletRegistrationBean(
          new MyServlet(), "/*");
          
      bean.setLoadOnStartup(1);    
      return bean;
  }

	public static void main(final String[] args) {
		SpringApplication.run(MySpringBootApp.class, args);
	}

}
