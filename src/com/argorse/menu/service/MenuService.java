package com.argorse.menu.service;

import java.sql.SQLException;
import java.util.List;

import com.argorse.menu.domain.Menu;

public interface MenuService {
	public void addMenu(Menu m) throws SQLException;

	public void updateMenu(Menu m) throws SQLException;

	public void updateMenuIsleaf(Menu m) throws SQLException;

	public void delMenuById(String id) throws SQLException;

	public Menu findMenuById(String id) throws SQLException;

	public List findAllFirstMenus() throws SQLException;

	public List findSecondMenusByPid(String pid) throws SQLException;
}
