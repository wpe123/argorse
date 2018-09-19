package com.argorse.news.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.argorse.news.dao.NewsDao;
import com.argorse.news.domain.News;
import com.argorse.util.BaseDao;;

public class NewsDaoImpl extends BaseDao implements NewsDao  {


	public void delNews(String id) {
		try {
			this.getSqlMapClient().delete("News.delNews",id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	
	public void insertNews(News news) {
       try {
		this.getSqlMapClient().insert("News.insertNews",news);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

	
	public List selectNews() {
		List newsList = new ArrayList();
		try {
			 newsList = this.getSqlMapClient().queryForList("News.selectNews");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newsList;
	}

	
	public News selectNewsById(String id) {
		News news = new News();
		try {
			List newsList = this.getSqlMapClient().queryForList("News.selectNewsById",id);
			news = (News)newsList.get(0);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return news;
	}

	
	public void updateNews(News news) {
         try {
			this.getSqlMapClient().update("News.updateNews",news);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}



	public List selectNewsByMap(Map map) throws SQLException {
		return this.getSqlMapClient().queryForList("News.selectNewsByMap",map);
	}

}
