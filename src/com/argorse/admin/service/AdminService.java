package com.argorse.admin.service;

import java.sql.SQLException;

import com.argorse.admin.domain.Admin;

public interface AdminService {
	public Admin findAdminByName(String name) throws SQLException;

	public void updateAdmin(Admin a) throws SQLException;
}
