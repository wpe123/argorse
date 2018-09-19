package com.argorse.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.argorse.menu.domain.Menu;
import com.argorse.menu.service.impl.MenuServiceImpl;
import com.argorse.news.service.impl.NewsServiceImpl;
import com.argorse.product.service.ProductService;
import com.argorse.product.service.impl.ProductServiceImpl;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception{
		
		ProductService pservice = new ProductServiceImpl();
		List productList = pservice.findAllProduct();
		
		NewsServiceImpl service = new NewsServiceImpl();
		List newslist = service.selectNews();
		/////////////////////////////////////////////////
		
		List menus = new ArrayList();
		MenuServiceImpl ms = new MenuServiceImpl();
		List firstMenuList = ms.findAllFirstMenus();
		
		for(int i=0;i<firstMenuList.size();i++){
			Menu fm = (Menu)firstMenuList.get(i);
			
			String fid = fm.getId();
			List secondMenuList = ms.findSecondMenusByPid(fid);
			
			Map map = new HashMap();
			map.put("firstMenu", fm);
			map.put("secondMenuList", secondMenuList);
			
			menus.add(map);
		}
		
		
		for(int i=0;i<menus.size();i++){
			Map map = (Map)menus.get(i);
			
			Menu fm = (Menu)map.get("firstMenu");
			List secondList = (List)map.get("secondMenuList");
			System.out.print(fm.getName()+">> ");
			for(int j=0;j<secondList.size();j++){
				System.out.print(((Menu)secondList.get(j)).getName()+" ");
			}
			System.out.println();
		}
	}

}
