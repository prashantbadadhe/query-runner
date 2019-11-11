package com.njit.dmsd.service;

import java.util.List;

import com.njit.dmsd.dto.QueryDto;

/**
 * Created by ashish on 13/5/17.
 */
public interface QueryService {
    QueryDto getQueryById(Integer queryId);
    void saveQuery(QueryDto queryDto);
    List<QueryDto> getAllQueries();
    
    List<List<Object>> getQueryResult(String queryKey);
}
