package com.njit.dmsd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.njit.dmsd.repository.UserRepository;

@SpringBootApplication
public class QueryRunnerApplication {
	@Autowired
	UserRepository userRepository;

	public static void main(String[] args) {
		SpringApplication.run(QueryRunnerApplication.class, args);
	}

}
