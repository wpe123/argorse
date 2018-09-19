package com.argorse.menu.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.argorse.menu.dao.MenuDao;
import com.argorse.menu.dao.impl.MenuDaoImpl;
import com.argorse.menu.domain.Menu;
import com.argorse.menu.service.MenuService;

public class MenuServiceImpl implements MenuService {

	private static MenuDao menuDao;
	
	static{
		menuDao = new MenuDaoImpl();
	}

	public void addMenu(Menu m) throws SQLException {
		menuDao.addMenu(m);
	}

	
	public void delMenuById(String id) throws SQLException {
		menuDao.delMenuById(id);
	}

	
	public List findAllFirstMenus() throws SQLException {
		return menuDao.findAllFirstMenus();
	}

	
	public List findSecondMenusByPid(String pid) throws SQLException {
		return menuDao.findSecondMenusByPid(pid);
	}


	public void updateMenu(Menu m) throws SQLException {
		menuDao.updateMenu(m);
	}

	
	public void updateMenuIsleaf(Menu m) throws SQLException {
		menuDao.updateMenuIsleaf(m);
	}

	
	public Menu findMenuById(String id) throws SQLException {
		return menuDao.findMenuById(id);
	}

}
