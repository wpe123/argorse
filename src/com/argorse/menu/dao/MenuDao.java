package com.argorse.menu.dao;

import java.sql.SQLException;
import java.util.List;

import com.argorse.menu.domain.Menu;
import com.argorse.product.domain.Product;

public interface MenuDao {

	public void addMenu(Menu m) throws SQLException;
	
	public void updateMenu(Menu m) throws SQLException;
	
	public void updateMenuIsleaf(Menu m) throws SQLException;
	
	public void delMenuById(String id) throws SQLException;
	
	public Menu findMenuById(String id) throws SQLException;
	
	public List findAllFirstMenus() throws SQLException;
	
	public List findSecondMenusByPid(String pid) throws SQLException;
}
