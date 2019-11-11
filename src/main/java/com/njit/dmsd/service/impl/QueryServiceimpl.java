package com.njit.dmsd.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.njit.dmsd.converter.QueryConverter;
import com.njit.dmsd.dto.QueryDto;
import com.njit.dmsd.entity.MyQuery;
import com.njit.dmsd.repository.MyQueryRepository;
import com.njit.dmsd.service.QueryService;

/**
 * Created by ashish on 13/5/17.
 */
@Service
public class QueryServiceimpl implements QueryService {
	@Autowired
	MyQueryRepository queryRepository;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public QueryDto getQueryById(Integer queryId) {
		return QueryConverter.entityToDto(queryRepository.getOne(queryId));
	}

	@Override
	public void saveQuery(QueryDto queryDto) {
		queryRepository.save(QueryConverter.dtoToEntity(queryDto));
	}

	@Override
	public List<QueryDto> getAllQueries() {
		return queryRepository.findAll().stream().map(QueryConverter::entityToDto).collect(Collectors.toList());
	}

	@Override
	public List<List<Object>> getQueryResult(String queryKey) {
		MyQuery myQuery = findByQueryKey(queryKey);
		List<List<Object>> result=new ArrayList<>();
		if (myQuery != null) {
			result=executeQuery(myQuery.getQueryValue());
		}

		return result;
	}

	public MyQuery findByQueryKey(String queryKey) {
		return queryRepository.findByQueryKey(queryKey);
	}

	public List<List<Object>> executeQuery(String query) {
		Connection con = null;
		List<List<Object>> result = new ArrayList<>();
		List<Object> rowData;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?useSSL=false", "root", "root");
			Statement stmt = con.createStatement();

			boolean status = stmt.execute(query);
			if (status) {
				// query is a select query.
				ResultSet rs = stmt.getResultSet();
				ResultSetMetaData rsmd = rs.getMetaData();

				int columnCount = rsmd.getColumnCount();
				List<Object> columnLables = new ArrayList<>();
				result.add(columnLables);
				for (int i = 1; i <= columnCount; i++) {
					columnLables.add(rsmd.getColumnLabel(i));
				}

				while (rs.next()) {
					rowData = new ArrayList<>();
					for (int i = 1; i <= columnCount; i++) {
						rowData.add(rs.getString(i));
					}
					result.add(rowData);
					System.out.println();
				}
				rs.close();
			} else {
				// query can be update or any query apart from select query
				int count = stmt.getUpdateCount();
				System.out.println("Total records updated: " + count);
			}
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}

		return result;
	}
}
