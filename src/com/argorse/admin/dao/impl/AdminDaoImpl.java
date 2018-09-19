package com.argorse.admin.dao.impl;

import java.sql.SQLException;

import com.argorse.admin.dao.AdminDao;
import com.argorse.admin.domain.Admin;
import com.argorse.util.BaseDao;

public class AdminDaoImpl extends BaseDao implements AdminDao {

	public void updateAdmin(Admin a) throws SQLException {
		this.getSqlMapClient().update("Admin.updateAdmin", a);
	}

	public Admin findAdminByName(String name) throws SQLException {
		return (Admin)this.getSqlMapClient().queryForObject("Admin.findAdminByName",name);
	}
}
