package com.argorse.admin.dao;

import java.sql.SQLException;

import com.argorse.admin.domain.Admin;

public interface AdminDao {

	public Admin findAdminByName(String name) throws SQLException;
	
	public void updateAdmin(Admin a) throws SQLException;
}
