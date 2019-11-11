package com.njit.dmsd.dto;

/**
 * Created by ashish on 13/5/17.
 */
public class QueryDto {
	Integer queryId;
	String queryKey;
	String queryName;

	public QueryDto(Integer queryId,String queryKey, String queryName) {
		this.queryId = queryId;
		this.queryName = queryName;
		this.queryKey = queryKey;
	}

	public Integer getQueryId() {
		return queryId;
	}

	public void setQueryId(Integer queryId) {
		this.queryId = queryId;
	}

	public String getQueryName() {
		return queryName;
	}

	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}

	public String getQueryKey() {
		return queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

}
