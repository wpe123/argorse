package com.argorse.admin.service.impl;

import java.sql.SQLException;

import com.argorse.admin.dao.AdminDao;
import com.argorse.admin.dao.impl.AdminDaoImpl;
import com.argorse.admin.domain.Admin;
import com.argorse.admin.service.AdminService;

public class AdminServiceImpl implements AdminService {
	
	private static AdminDao adminDao = new AdminDaoImpl();

	public Admin findAdminByName(String name) throws SQLException {
		return adminDao.findAdminByName(name);
	}

	public void updateAdmin(Admin a) throws SQLException {
		adminDao.updateAdmin(a);
	}

}
