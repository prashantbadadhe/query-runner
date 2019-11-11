package com.njit.dmsd.converter;

import com.njit.dmsd.dto.QueryDto;
import com.njit.dmsd.entity.MyQuery;

/**
 * Created by ashish on 13/5/17.
 */
public class QueryConverter {
	public static MyQuery dtoToEntity(QueryDto queryDto) {
		MyQuery query = new MyQuery(queryDto.getQueryKey(),queryDto.getQueryName());
		query.setQueryId(queryDto.getQueryId());		
		return query;
	}

	public static QueryDto entityToDto(MyQuery query) {
		QueryDto queryDto = new QueryDto(query.getQueryId(),query.getQueryKey(), query.getQueryName());
		return queryDto;
	}
}
