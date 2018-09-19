package com.argorse.util;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class BaseDao {

	private static SqlMapClient sqlMapClient = null;
	static{
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
	}
	
	public SqlMapClient getSqlMapClient(){
		return sqlMapClient;
	}
}
