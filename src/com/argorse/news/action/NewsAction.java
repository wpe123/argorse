package com.argorse.news.action;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.apache.struts.upload.FormFile;
import com.argorse.news.domain.News;
import com.argorse.news.domain.ImageForm;
import com.argorse.news.service.NewsService;
import com.argorse.news.service.impl.NewsServiceImpl;
import com.argorse.util.uploadImg;

public class NewsAction extends DispatchAction{
      private NewsService newsService = new NewsServiceImpl();

	public ActionForward insertNews(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
		  String img_path = uploadImg.upload((ImageForm)form, request);
    	  News news = new News();
    	  String title= null == request.getParameter("title") ? "" : request
  				.getParameter("title");
    	  String content= null == request.getParameter("content") ? "" : request
    			  .getParameter("content");
    	  news.setId(UUID.randomUUID().toString());
    	  news.setTitle(title);
    	  news.setContent(content);
    	  news.setCreatetime(new Date());
    	  news.setUpdatetime(new Date());
    	  if(null!=img_path){news.setImg_path(img_path);}
    	  else{news.setImg_path("default.jpg");}
    	  newsService.insertNews(news);
    	  return mapping.findForward("addsucc");
  	}

  	public ActionForward delNews(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		newsService.delNews(id);
  		return mapping.findForward("delsucc");
  	}
  	public ActionForward delNewsMore(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		String[] ids = id.split(",");
  		for(int i=0;i<ids.length;i++){
  		  newsService.delNews(ids[i]);
  		}
  		return mapping.findForward("delsucc");
  	}

  	public ActionForward selectNews(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		List newsList = 
  		newsService.selectNews();
  		request.getSession().setAttribute("newsList", newsList);
  		return mapping.findForward("toNewsList");
  	}
  	public ActionForward selectNewsByMap(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		Map map = new HashMap();
  		String title = request.getParameter("title"); 
  		String begintime = request.getParameter("begintime"); 
  		String endtime = request.getParameter("endtime"); 
  		map.put("title", title);
  		map.put("begintime", begintime);
  		map.put("endtime", endtime);
  		List newsList = new ArrayList();
		try {
			newsList = newsService.selectNewsByMap(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
  		request.getSession().setAttribute("newsList", newsList);
  		return mapping.findForward("toNewsList");
  	}

  	public ActionForward selectNewsById(ActionMapping mapping,ActionForm form,
  			HttpServletRequest request, HttpServletResponse response) { // 
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		News news = new News();
  		news=newsService.selectNewsById(id);
  		request.setAttribute("news", news);
  		return mapping.findForward("toNewsDetail");
  	}

  	public ActionForward updateNews(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { //
  	  String img_path = uploadImg.upload((ImageForm)form, request);
  	  News news = new News();
  	  String id= null == request.getParameter("id") ? "" : request
  			  .getParameter("id");
   	  String title= null == request.getParameter("title") ? "" : request
 				.getParameter("title");
   	  String content= null == request.getParameter("content") ? "" : request
   			  .getParameter("content");
   	  news.setId(id);
   	  news.setTitle(title);
   	  news.setContent(content);
   	  news.setUpdatetime(new Date());
   	  if(null!=img_path){news.setImg_path(img_path);}
   	  newsService.updateNews(news);
  	  return mapping.findForward("updatesucc");
  		
  	}
  	public ActionForward delImg(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { //
  		News news = new News();
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		news.setId(id);
  		news.setImg_path("default.jpg");
  		newsService.updateNews(news);
  		return mapping.findForward("updatesucc");
  		
  	}
  	public ActionForward selectNewsToList(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		List newsList = 
  			newsService.selectNews();
  		request.setAttribute("newsList", newsList);
  		return mapping.findForward("toForwardNewsList");
  	}
  	public ActionForward selectNewsToShow(ActionMapping mapping,ActionForm form, HttpServletRequest request,
  			HttpServletResponse response) { // 
  		List newsList = 
  			newsService.selectNews();
  		request.setAttribute("newsList", newsList);
  		return mapping.findForward("toForwardNewsShow");
  	}
  	public ActionForward selectNewsToShowById(ActionMapping mapping,ActionForm form,
  			HttpServletRequest request, HttpServletResponse response) { // 
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		News news = new News();
  		news=newsService.selectNewsById(id);
  		request.setAttribute("news", news);
  		return mapping.findForward("toForwardNewsDetail");
  	}
  	public ActionForward selectNewsImgById(ActionMapping mapping,ActionForm form,
  			HttpServletRequest request, HttpServletResponse response) { // 
  		String id= null == request.getParameter("id") ? "" : request
  				.getParameter("id");
  		News news = new News();
  		news=newsService.selectNewsById(id);
  		request.setAttribute("news", news);
  		return mapping.findForward("toshowNewsImg");
  	}
}
