package com.argorse.product.action;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.argorse.news.domain.ImageForm;
import com.argorse.product.domain.Product;
import com.argorse.product.service.ProductService;
import com.argorse.product.service.impl.ProductServiceImpl;
import com.argorse.util.uploadImg;

public class ProductAction extends DispatchAction {
	
	private static ProductService service = new ProductServiceImpl();

	public ActionForward addProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String img_path = uploadImg.upload((ImageForm)form, request);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Product p = new Product();
		p.setId(UUID.randomUUID().toString());
		p.setTitle(title);
		p.setContent(content);
		p.setCreateTime(new Date());
		p.setUpdateTime(new Date());
		if (null != img_path) {
			p.setPath(img_path);
		}else{
			p.setPath("default.jpg");
		}
		service.addProduct(p);
		return mapping.findForward("addProduct");
	}
	
	public ActionForward findAllProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List pList = service.findAllProduct();
		request.getSession().setAttribute("productList", pList);
		return mapping.findForward("showProducts");
	}
	
	public ActionForward showProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String id = request.getParameter("id");
		Product p = service.findProductById(id);
		request.setAttribute("product", p);
		return mapping.findForward("showProduct");
	}
	public ActionForward showProductImg(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		
		String id = request.getParameter("id");
		Product p = service.findProductById(id);
		request.setAttribute("product", p);
		return mapping.findForward("showProductImg");
	}
	
	public ActionForward delProductById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String id = request.getParameter("id");
		service.delProductById(id);
		return mapping.findForward("delProductById");
	}
	public ActionForward delProductMoreById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		
		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		String[] ids = id.split(",");
  		for(int i=0;i<ids.length;i++){
  			service.delProductById(ids[i]);
  		}
		return mapping.findForward("delProductById");
	}
	
	public ActionForward showProductById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String id = request.getParameter("id");
		Product p = service.findProductById(id);
		request.setAttribute("product", p);
		return mapping.findForward("showProductForUpdate");
	}
	
	public ActionForward updateProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String img_path = uploadImg.upload((ImageForm)form, request);
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Product p = new Product();
		p.setId(id);
		p.setTitle(title);
		p.setContent(content);
		p.setUpdateTime(new Date());
		if(null!=img_path){p.setPath(img_path);}
		service.updateProduct(p);
		return mapping.findForward("updateProduct");
	}
	public ActionForward delImg(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		Product p = new Product();
		String id = request.getParameter("id");
		p.setId(id);
		p.setPath("default.jpg");
		service.updateProduct(p);
		return mapping.findForward("updateProduct");
	}

}
