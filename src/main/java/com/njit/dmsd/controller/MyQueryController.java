package com.njit.dmsd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.njit.dmsd.dto.QueryDto;
import com.njit.dmsd.service.QueryService;
import com.njit.dmsd.utils.Constants;

/**
 * Created by ashish on 13/5/17.
 */
@RequestMapping("/query")
@RestController
public class MyQueryController {
	@Autowired
	QueryService queryService;

	@RequestMapping(Constants.GET_QUERY_BY_ID)
	public QueryDto getQueryById(@PathVariable Integer queryId) {
		return queryService.getQueryById(queryId);
	}

	@RequestMapping(Constants.GET_ALL_QUERIES)
	public List<QueryDto> getAllQueries() {
		return queryService.getAllQueries();
	}

	@RequestMapping(value = Constants.SAVE_QUERY, method = RequestMethod.POST)
	public void saveQuery(@RequestBody QueryDto queryDto) {
		queryService.saveQuery(queryDto);
	}

	@RequestMapping(Constants.GET_QUERY_RESULT)
	public List<List<Object>> getQueryResult(@PathVariable String queryKey) {
		return queryService.getQueryResult(queryKey);
	}

}
