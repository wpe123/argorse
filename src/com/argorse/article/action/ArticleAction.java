package com.argorse.article.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.argorse.article.domain.Article;
import com.argorse.article.service.ArticleService;
import com.argorse.article.service.impl.ArticleServiceImpl;
import com.argorse.menu.domain.Menu;
import com.argorse.menu.service.MenuService;
import com.argorse.menu.service.impl.MenuServiceImpl;
import com.argorse.news.domain.ImageForm;

public class ArticleAction extends DispatchAction {
	
	private MenuService menuService = new MenuServiceImpl();
	private ArticleService articleService = new ArticleServiceImpl();

	public ActionForward findSecondMenus(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		List sercodMenus = menuService.findSecondMenusByPid(id);
		String str = "";
		
		for(int i=0;i <sercodMenus.size();i++){
			Menu twoColumn=(Menu)sercodMenus.get(i);
			str=str+twoColumn.getId()+","+twoColumn.getName()+"|";
		}
		out.write(str);
		out.flush();
		
		return null;
	}
	
	public ActionForward addArticle(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List firstMenus = menuService.findAllFirstMenus();
		request.setAttribute("firstMenus", firstMenus);
		
		return mapping.findForward("addAritcle");
	}
	
	public ActionForward insertArticle(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String img_path = com.argorse.util.uploadImg.upload((ImageForm)form, request);
		String menuid = request.getParameter("menuid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Article a = new Article();
		a.setId(UUID.randomUUID().toString());
		a.setMenuid(menuid);
		a.setTitle(title);
		a.setContent(content);
		a.setCreatetime(new Date());
		a.setUpdatetime(new Date());
		if(null!=img_path){a.setImg_path(img_path);}
		articleService.addArticle(a);
		
		List firstMenus = menuService.findAllFirstMenus();
		request.setAttribute("firstMenus", firstMenus);
		return mapping.findForward("addAritcle");
	}
	
	public ActionForward findAllArticles(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List articleList = articleService.findAllArticles();
		
		List articles = new ArrayList();
		for(int i=0;i<articleList.size();i++){
			Article ar = (Article)articleList.get(i);
			String menuid = ar.getMenuid();
			Menu menu = menuService.findMenuById(menuid);
			Map map = new HashMap();
			map.put("article", ar);
			if(menu != null){
				map.put("menuName", menu.getName());
				if(menu.getLevel()==1){
					map.put("menulevel", "涓�绾ц彍鍗�");
				}else{
					map.put("menulevel", "浜岀骇鑿滃崟");
				}
			}
			articles.add(map);
		}
		request.getSession().setAttribute("articleList", articles);
		
		List firstMenus = menuService.findAllFirstMenus();
		request.getSession().setAttribute("firstMenus", firstMenus);
		return mapping.findForward("findAllArticles");
	}
	
	public ActionForward selectArticleByMap(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		Map map = new HashMap();
		
		String firstMenus = request.getParameter("firstMenus");
		String secondMenus = request.getParameter("secondMenus");
		String title = request.getParameter("title");
		if("0".equals(secondMenus)||null==secondMenus||"all".equals(secondMenus)){
			String[] firstMenuss = firstMenus.split(",");
			firstMenus = firstMenuss[0];
			if(!"0".equals(firstMenus)){
			map.put("menuid", firstMenus);}
		}
		else {map.put("menuid", secondMenus);}
		if(null!=title&&!"".equals(title)){	map.put("title", title);}
	
//		List firstMenus = menuService.findAllFirstMenus();
//		request.setAttribute("firstMenus", firstMenus);
		List articleList = articleService.selectArticleByMap(map);
		
		List articles = new ArrayList();
		for(int i=0;i<articleList.size();i++){
			Article ar = (Article)articleList.get(i);
			String menuid = ar.getMenuid();
			Menu menu = menuService.findMenuById(menuid);
			Map map1 = new HashMap();
			map1.put("article", ar);
			if(menu != null){
				map1.put("menuName", menu.getName());
				if(menu.getLevel()==1){
					map1.put("menulevel", "涓�绾ц彍鍗�");
				}else{
					map1.put("menulevel", "浜岀骇鑿滃崟");
				}
			}
			articles.add(map1);
		}
		request.getSession().setAttribute("articleList", articles);
		return mapping.findForward("findAllArticles");
	}
	
	public ActionForward showArticle(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String id = request.getParameter("id");
		request.setAttribute("article", articleService.findArticleById(id));
		return mapping.findForward("showArticle");
	}
	
	public ActionForward delArticleById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String id = request.getParameter("id");
		articleService.delArticleById(id);
		return mapping.findForward("delArticleById");
	}
	
	public ActionForward delArticleMoreById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		
		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		String[] ids = id.split(",");
  		for(int i=0;i<ids.length;i++){
  			articleService.delArticleById(ids[i]);
  		}
		return mapping.findForward("delArticleById");
	}
	
	public ActionForward showArticleById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List firstMenus = menuService.findAllFirstMenus();
		request.setAttribute("firstMenus", firstMenus);
		
		String id = request.getParameter("id");
		Article article = articleService.findArticleById(id);
		String menuid= article.getMenuid();
		Menu menu = menuService.findMenuById(menuid);
		
		if(menu.getLevel()==2)
		{
			String secondmenuid = menu.getId();
			String firstmenuid=menu.getPid();
			Menu firstmenu = menuService.findMenuById(firstmenuid);
			List secondmenusList= menuService.findSecondMenusByPid(firstmenuid);
			
			request.setAttribute("secondmenusList", secondmenusList);
			request.setAttribute("firstmenu", firstmenu);
		}
		else
		{   Menu menu2  = new Menu();
			request.setAttribute("firstmenu",menu2);
		}
		
		request.setAttribute("menu", menu);
		request.setAttribute("article", article);
		return mapping.findForward("showArticleForUpdate");
	}
	
	public ActionForward updateArticle(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String img_path = com.argorse.util.uploadImg.upload((ImageForm)form, request);
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String firstMenus=request.getParameter("firstMenus");
		String secondMenus=request.getParameter("secondMenus");
		Article a = new Article();
		a.setId(id);
		a.setTitle(title);
		a.setContent(content);
		if("0".equals(secondMenus))
		{
			String[] firstmenu =  firstMenus.split(",");
			a.setMenuid(firstmenu[0]);
		}
		else
		{
			a.setMenuid(secondMenus);
		}
		
		a.setUpdatetime(new Date());
		if(null!=img_path){a.setImg_path(img_path);}
		articleService.updateArticle(a);
		
		//List articleList = articleService.findAllArticles();
		//request.setAttribute("articleList", articleList);
		this.findAllArticles(mapping, form, request, response);
		return mapping.findForward("updatesucc");
	}

}
