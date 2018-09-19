package com.argorse.product.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.argorse.product.dao.ProductDao;
import com.argorse.product.dao.impl.ProductDaoImpl;
import com.argorse.product.domain.Product;
import com.argorse.product.service.ProductService;

public class ProductServiceImpl implements ProductService {
	
	private static ProductDao productDao;
	
	static{
		productDao = new ProductDaoImpl();
	}

	
	public void addProduct(Product p) throws SQLException {
		productDao.addProduct(p);
	}

	
	public void delProductById(String id) throws SQLException {
		productDao.delProductById(id);
	}


	public List findAllProduct() throws SQLException {
		return productDao.findAllProduct();
	}

	
	public Product findProductById(String id) throws SQLException {
		return productDao.findProductById(id);
	}


	public void updateProduct(Product p) throws SQLException {
		productDao.updateProduct(p);
	}

}
