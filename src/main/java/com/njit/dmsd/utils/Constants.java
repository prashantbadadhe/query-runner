package com.njit.dmsd.utils;

public interface Constants {
	static final String GET_USER_BY_ID = "/getUser/{userId}";
	static final String GET_ALL_USERS = "/getAllUsers";
	static final String SAVE_USER = "/saveUser";
	
	static final String GET_QUERY_BY_ID = "/getQuery/{queryId}";
	static final String GET_ALL_QUERIES = "/getAllQueries";
	static final String SAVE_QUERY = "/saveQuery";
	static final String GET_QUERY_RESULT = "/getQueryResult/{queryKey}";
}
