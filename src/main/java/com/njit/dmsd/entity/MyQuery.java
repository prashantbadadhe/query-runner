package com.njit.dmsd.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by ashish on 13/5/17.
 */
@Entity
public class MyQuery implements Serializable {

	private static final long serialVersionUID = 0x62A6DA99AABDA8A8L;

	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private Integer queryId;

	@Column
	private String queryKey;

	@Column
	private String queryName;

	@Column
	private String queryValue;

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

	public String getQueryValue() {
		return queryValue;
	}

	public void setQueryValue(String queryValue) {
		this.queryValue = queryValue;
	}

	public MyQuery() {
	}

	public MyQuery(String queryKey, String queryName) {
		this.queryKey = queryKey;
		this.queryName = queryName;
	}
}
