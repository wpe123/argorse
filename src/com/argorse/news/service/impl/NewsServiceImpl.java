package com.argorse.news.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.argorse.news.dao.NewsDao;
import com.argorse.news.dao.impl.NewsDaoImpl;
import com.argorse.news.domain.News;
import com.argorse.news.service.NewsService;

public class NewsServiceImpl implements NewsService {
    private NewsDao newsDao = new NewsDaoImpl();
	
	public void delNews(String id) {
		newsDao.delNews(id);
	}

	
	public void insertNews(News news) {
		newsDao.insertNews(news);
	}

	
	public List selectNews() {
		
		return newsDao.selectNews();
	}

	
	public News selectNewsById(String id) {
		return newsDao.selectNewsById(id);
	}

	
	public void updateNews(News news) {
		newsDao.updateNews(news);
	}



	public List selectNewsByMap(Map map) throws SQLException {
		return newsDao.selectNewsByMap(map);
	}

}
