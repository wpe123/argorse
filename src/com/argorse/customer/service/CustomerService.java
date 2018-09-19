package com.argorse.customer.service;

import java.util.List;

import com.argorse.customer.domain.Customer;

public interface CustomerService {
	
	   public void insertCustomer(Customer customer);//增加客户
	   
	   public void delCustomer(String id);//删除客户
	   
	   public List selectCustomer();//查询客户
	   
	   public Customer selectCustomerById(String id);//根据Id查询客户
	   
	   public void updateCustomer(Customer customer);//更新客户
}
