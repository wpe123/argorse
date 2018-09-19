package com.argorse.customer.action;


import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.argorse.customer.domain.Customer;
import com.argorse.customer.service.CustomerService;
import com.argorse.customer.service.impl.CustomerServiceImpl;


public class CustomerAction extends DispatchAction{
	  private CustomerService customerService = new CustomerServiceImpl();

	  public ActionForward insertCustomer(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
    	  Customer customer = new Customer();
    	  String name= null == request.getParameter("name") ? "" : request
  				.getParameter("name");
    	  String content= null == request.getParameter("content") ? "" : request
    			  .getParameter("content");
    	  String address= null == request.getParameter("address") ? "" : request
    			  .getParameter("address");
    	  String tel= null == request.getParameter("tel") ? "" : request
    			  .getParameter("tel");
    	  customer.setId(UUID.randomUUID().toString());
    	  customer.setCname(name);
    	  customer.setContent(content);
    	  customer.setAddress(address);
    	  customer.setTel(tel);
    	  customerService.insertCustomer(customer);
    	  return mapping.findForward("addsucc");
  	}
	  public ActionForward askforCustomer(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			  HttpServletResponse response) { // 
		  Customer customer = new Customer();
		  String name= null == request.getParameter("name") ? "" : request
				  .getParameter("name");
		  String content= null == request.getParameter("content") ? "" : request
				  .getParameter("content");
		  String address= null == request.getParameter("address") ? "" : request
				  .getParameter("address");
		  String tel= null == request.getParameter("tel") ? "" : request
				  .getParameter("tel");
		  customer.setId(UUID.randomUUID().toString());
		  customer.setCname(name);
		  customer.setContent(content);
		  customer.setAddress(address);
		  customer.setTel(tel);
		  customerService.insertCustomer(customer);
		  return mapping.findForward("asksucc");
	  }

  	public ActionForward delCustomer(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		customerService.delCustomer(id);
  		return mapping.findForward("delsucc");
  	}
  	public ActionForward delCustomerMore(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		String[] ids = id.split(",");
  		for(int i=0;i<ids.length;i++){
  			customerService.delCustomer(ids[i]);
  		}
  		return mapping.findForward("delsucc");
  	}

  	public ActionForward selectCustomer(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		List customerList = 
  			customerService.selectCustomer();
  		request.setAttribute("customerList",customerList);
  		return mapping.findForward("toCustomerList");
  	}

  	public ActionForward selectCustomerById(ActionMapping mapping,ActionForm form,
  			HttpServletRequest request, HttpServletResponse response) { // 
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		Customer customer = new Customer();
  		customer=customerService.selectCustomerById(id);
  		request.setAttribute("customer", customer);
  		return mapping.findForward("toCustomerDetail");
  	}

  	public ActionForward updateCustomer(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		  Customer customer = new Customer();
  		  String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
   	      String name= null == request.getParameter("name") ? "" : request
 				.getParameter("name");
   	      String content= null == request.getParameter("content") ? "" : request
   			  .getParameter("content");
   	      String address= null == request.getParameter("address") ? "" : request
   			  .getParameter("address");
   	      String tel= null == request.getParameter("tel") ? "" : request
   			  .getParameter("tel");
   	      customer.setId(id);
   	      customer.setCname(name);
   	      customer.setContent(content);
   	      customer.setAddress(address);
   	      customer.setTel(tel);
   	      customerService.updateCustomer(customer);
  		return mapping.findForward("updatesucc");
  		
  	}
  	
  	public ActionForward selectCustomerToList(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		List customerList = 
  			customerService.selectCustomer();
  		request.setAttribute("customerList",customerList);
  		return mapping.findForward("toForwardCustomerList");
  	}
}
