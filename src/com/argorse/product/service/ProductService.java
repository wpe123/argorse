package com.argorse.product.service;

import java.sql.SQLException;
import java.util.List;

import com.argorse.product.domain.Product;

public interface ProductService {

	public void addProduct(Product p) throws SQLException;

	public void updateProduct(Product p) throws SQLException;

	public void delProductById(String id) throws SQLException;

	public List findAllProduct() throws SQLException;

	public Product findProductById(String id) throws SQLException;
}
