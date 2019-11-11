package com.njit.dmsd.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.njit.dmsd.entity.MyQuery;

/**
 * Created by ashish on 13/5/17.
 */
@Repository
public interface MyQueryRepository extends JpaRepository<MyQuery, Integer>{
	
	MyQuery findByQueryKey(String queryKey);
	
	@Query(value = ":sqlQuery", 
			  nativeQuery = true)
	Collection<Object> runAnyQuery(@Param("sqlQuery")String sqlQuery);
	
}
