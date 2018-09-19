package com.argorse.customer.service.impl;

import java.util.List;

import com.argorse.customer.dao.CustomerDao;
import com.argorse.customer.dao.impl.CustomerDaoImpl;
import com.argorse.customer.domain.Customer;
import com.argorse.customer.service.CustomerService;
import com.argorse.util.BaseDao;

public class CustomerServiceImpl  implements CustomerService{
   private CustomerDao customerDao = new CustomerDaoImpl();

	public void delCustomer(String id) {
		customerDao.delCustomer(id);
	}

	
	public void insertCustomer(Customer customer) {
		customerDao.insertCustomer(customer);
	}


	public List selectCustomer() {
		return customerDao.selectCustomer();
	}

	
	public Customer selectCustomerById(String id) {
		return customerDao.selectCustomerById(id);
	}

	
	public void updateCustomer(Customer customer) {
		customerDao.updateCustomer(customer);		
	}

}
