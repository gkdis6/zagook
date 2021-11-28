package com.project.zagook;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.project.*"})
public class ZagookApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZagookApplication.class, args);
	}

}
