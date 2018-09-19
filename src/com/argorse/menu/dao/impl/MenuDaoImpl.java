package com.argorse.menu.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.argorse.menu.dao.MenuDao;
import com.argorse.menu.domain.Menu;
import com.argorse.product.domain.Product;
import com.argorse.util.BaseDao;

public class MenuDaoImpl extends BaseDao implements MenuDao {


	public void addMenu(Menu m) throws SQLException {
		this.getSqlMapClient().insert("Menu.addMenu", m);
	}

	
	public void delMenuById(String id) throws SQLException {
		this.getSqlMapClient().delete("Menu.delMenuById", id);
	}


	public List findAllFirstMenus() throws SQLException {
		return this.getSqlMapClient().queryForList("Menu.findAllFirstMenus");
	}

	
	public List findSecondMenusByPid(String pid) throws SQLException {
		return (List)this.getSqlMapClient().queryForList("Menu.findSecondMenusByPid",pid);
	}

	
	public void updateMenu(Menu m) throws SQLException {
		this.getSqlMapClient().update("Menu.updateMenu", m);
	}

	
	public void updateMenuIsleaf(Menu m) throws SQLException {
		this.getSqlMapClient().update("Menu.updateMenuisleaf", m);
		
	}

	
	public Menu findMenuById(String id) throws SQLException {
		
		return (Menu)this.getSqlMapClient().queryForObject("Menu.findMenuById", id);
	}

}
