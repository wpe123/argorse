package com.argorse.customer.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.argorse.customer.dao.CustomerDao;
import com.argorse.customer.domain.Customer;
import com.argorse.util.BaseDao;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {


	public void delCustomer(String id) {
		try {
			this.getSqlMapClient().delete("Customer.delCustomer",id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	
	public void insertCustomer(Customer customer) {
       try {
		this.getSqlMapClient().insert("Customer.insertCustomer",customer);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

	
	public List selectCustomer() {
		List customerList = new ArrayList();
		try {
			customerList = this.getSqlMapClient().queryForList("Customer.selectCustomer");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerList;
	}

	
	public Customer selectCustomerById(String id) {
		Customer customer = new Customer();
		try {
			List customerList = this.getSqlMapClient().queryForList("Customer.selectCustomerById",id);
			customer = (Customer)customerList.get(0);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}


	public void updateCustomer(Customer Customer) {
         try {
			this.getSqlMapClient().update("Customer.updateCustomer",Customer);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
