package com.argorse.product.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.argorse.product.dao.ProductDao;
import com.argorse.product.domain.Product;
import com.argorse.util.BaseDao;

public class ProductDaoImpl extends BaseDao implements ProductDao {


	public void addProduct(Product p) throws SQLException{
		this.getSqlMapClient().insert("Product.addProduct", p);
	}

	
	public void delProductById(String id) throws SQLException{
		this.getSqlMapClient().delete("Product.delProductById", id);
	}

	
	public List findAllProduct() throws SQLException{
		return this.getSqlMapClient().queryForList("Product.findAllProduct");
	}


	public Product findProductById(String id) throws SQLException{
		return (Product)this.getSqlMapClient().queryForObject("Product.findProductById",id);
	}

	
	public void updateProduct(Product p) throws SQLException{
		this.getSqlMapClient().update("Product.updateProduct", p);
	}

}
