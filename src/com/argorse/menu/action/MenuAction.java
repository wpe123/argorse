package com.argorse.menu.action;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.argorse.menu.domain.Menu;
import com.argorse.menu.service.MenuService;
import com.argorse.menu.service.impl.MenuServiceImpl;

public class MenuAction extends DispatchAction {
	private static MenuService service = new MenuServiceImpl();

	public ActionForward findFirstMenus(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List firstMenus = service.findAllFirstMenus();
		request.setAttribute("firstMenus", firstMenus);
		return mapping.findForward("firstMenus");
	}
	
	//添加一级菜单
	public ActionForward addMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String name = request.getParameter("name");
		String id = UUID.randomUUID().toString();
		
		Menu m = new Menu();
		m.setId(id);
		m.setName(name);
		m.setLevel(1);
		m.setIsleaf(1);
		
		service.addMenu(m);
		return mapping.findForward("addMenu");
	}
	
	public ActionForward delMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("id");
		service.delMenuById(id);
		return mapping.findForward("delMenu");
	}
	
	public ActionForward updateMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("id");
		String name = request.getParameter("menuName");
		Menu m = new Menu();
		m.setId(id);
		m.setName(name);
		service.updateMenu(m);
		return mapping.findForward("updateMenu");
	}
	
	public ActionForward secondMenus(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List firstMenus = service.findAllFirstMenus();
		request.getSession().setAttribute("firstMenus", firstMenus);
		if(null != request.getParameter("m") && "updateSecondMenu".equals(request.getParameter("m"))){
			return mapping.findForward("orderbySecondMenu");
		}
		return mapping.findForward("secondMenus");
	}
	
	public ActionForward findSecondMenusByPid(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String pid = request.getParameter("pid");
		
		List secondMenus = service.findSecondMenusByPid(pid);
		request.setAttribute("secondMenus", secondMenus);
		request.setAttribute("pid", pid);
		if(null != request.getParameter("m") && "updateSecondMenu".equals(request.getParameter("m"))){
			return mapping.findForward("orderbySecondMenu");
		}
		return mapping.findForward("findSecondMenusByPid");
	}
	
	public ActionForward delSecondMenuById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String pid = request.getParameter("pid");
		String id = request.getParameter("id");
		service.delMenuById(id);
		List secondMenus = service.findSecondMenusByPid(pid);
		
		if(secondMenus == null || secondMenus.size() == 0){
			Menu m = new Menu();
			m.setId(pid);
			m.setIsleaf(1);
			service.updateMenuIsleaf(m);
		}
		
		request.setAttribute("secondMenus", secondMenus);
		request.setAttribute("pid", pid);
		return mapping.findForward("findSecondMenusByPid");
	}
	
	public ActionForward updateSecondMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String pid = request.getParameter("pid");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		Menu m = new Menu();
		m.setId(id);
		m.setName(name);
		
		service.updateMenu(m);
		
		List secondMenus = service.findSecondMenusByPid(pid);
		request.setAttribute("secondMenus", secondMenus);
		request.setAttribute("pid", pid);
		return mapping.findForward("findSecondMenusByPid");
	}
	
	public ActionForward addSecondMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String pid = request.getParameter("pid");
		String name = request.getParameter("secondMenuName");
		
		Menu m = new Menu();
		m.setId(UUID.randomUUID().toString());
		m.setName(name);
		m.setPid(pid);
		m.setLevel(2);
		m.setIsleaf(1);
		
		service.addMenu(m);
		
		Menu m2 = new Menu();
		m2.setId(pid);
		m2.setIsleaf(0);
		
		service.updateMenuIsleaf(m2);
		
		List secondMenus = service.findSecondMenusByPid(pid);
		request.setAttribute("secondMenus", secondMenus);
		request.setAttribute("pid", pid);
		return mapping.findForward("findSecondMenusByPid");
	}
	
	public ActionForward orderbyFirstMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List list = service.findAllFirstMenus();
		for(int i=0;i<list.size();i++){
			Menu m = (Menu)list.get(i);
			String id = m.getId();
			String orderby = request.getParameter(id);
			m.setOrderby(orderby);
			service.updateMenu(m);
		}
		return mapping.findForward("findSecondMenusByPid");
	}
	
	public ActionForward orderbySecondMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String fmenuid = request.getParameter("fid");
		List list = service.findSecondMenusByPid(fmenuid);
		for(int i=0;i<list.size();i++){
			Menu m = (Menu)list.get(i);
			String id = m.getId();
			String orderby = request.getParameter(id);
			m.setOrderby(orderby);
			service.updateMenu(m);
		}
		return mapping.findForward("findSecondMenusByPid");
	}

}
