<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.argorse.menu.service.impl.MenuServiceImpl"%>
<%@page import="com.argorse.menu.domain.Menu"%>
<%@page import="com.argorse.product.service.impl.ProductServiceImpl"%>
<%@page import="com.argorse.product.service.ProductService"%>
<%@page import="com.argorse.util.*"%>
<%	session.setAttribute("path", request.getContextPath());

	String t = (String)session.getAttribute("Tel");
	
	if(t == null){
		String rpath = request.getSession().getServletContext().getRealPath("") + java.io.File.separator + "WEB-INF" + java.io.File.separator + "config.properties";
		//String rpath = "config.properties";
		//rpath = new String(rpath.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("rpath = " + rpath);
		ConfigReader r = new ConfigReader(rpath);
		String tel = r.getValue("Tel");
		String fax = r.getValue("Fax");
		String email = r.getValue("E-mail");
		String addr = r.getValue("Addr");
		addr = new String(addr.getBytes("iso-8859-1"), "UTF-8");
		session.setAttribute("tel", tel);
		session.setAttribute("fax", fax);
		session.setAttribute("email", email);
		session.setAttribute("addr", addr);
	}
	
//菜单，包括一级菜单和二级菜单
	List menus =  (List)session.getAttribute("menus");
	if(menus == null){
		menus = new ArrayList();
		MenuServiceImpl menuService = new MenuServiceImpl();
		List firstMenuList = menuService.findAllFirstMenus();
	
		for (int i = 0; i < firstMenuList.size(); i++) {
			Menu fm = (Menu) firstMenuList.get(i);
	
			String fid = fm.getId();
			List secondMenuList = menuService.findSecondMenusByPid(fid);
	
			Map map = new HashMap();
			map.put("firstMenu", fm);
			map.put("secondMenuList", secondMenuList);
	
			menus.add(map);
			
			if(fm.getName().equals("解决方案")){
				session.setAttribute("solutions",secondMenuList);
				session.setAttribute("solutionMenuId",fid);
			}
			
			if(fm.getName().equals("成功案例")){
				session.setAttribute("SuccessStories",secondMenuList);
				session.setAttribute("SuccessStoriesMenuId",fid);
			}
		}
		//将菜单放入session中，供各个页面使用
		session.setAttribute("menus", menus);
	}
	
	//产品列表
	if(session.getAttribute("productList") == null){
		ProductService pservice = new ProductServiceImpl();
		List productList = pservice.findAllProduct();
		session.setAttribute("productList", productList);
	}
	
%>
