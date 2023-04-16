package net._1di.piproserver;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

@SpringBootApplication
@MapperScan("net._1di.piproserver.mapper")
public class PiProServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(PiProServerApplication.class, args);
	}

}
