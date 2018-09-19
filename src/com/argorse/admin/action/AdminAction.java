package com.argorse.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.argorse.admin.domain.Admin;
import com.argorse.admin.service.AdminService;
import com.argorse.admin.service.impl.AdminServiceImpl;

public class AdminAction extends DispatchAction {
	
	private static AdminService adminService = new AdminServiceImpl();

	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boolean flag = false;
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		Admin admin = adminService.findAdminByName(name);
		
		if(admin != null){
			if(password.equals(admin.getAdmin_password())){
				flag = true;
				request.getSession().setAttribute("admin", admin);
			}
		}
		if(flag){
			return mapping.findForward("success");
		}
		return mapping.findForward("error");
		
	}
	
	public ActionForward updateAdmin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		
		if(admin == null){
			return mapping.findForward("error");
		}
		else{
			String oldpass = admin.getAdmin_password();
			String adminId = admin.getId();
			String adminName = admin.getAdmin_name();
			
			String password = request.getParameter("oldpassword");
			
			if(oldpass.equals(password)){
				String newpass = request.getParameter("newpassword");
				Admin a = new Admin();
				a.setId(adminId);
				a.setAdmin_name(adminName);
				a.setAdmin_password(newpass);
				
				adminService.updateAdmin(a);
				request.getSession().setAttribute("admin", a);
				request.setAttribute("msg", "修改成功！");
				
			}
		}
	
		return mapping.findForward("update");
	}

}
