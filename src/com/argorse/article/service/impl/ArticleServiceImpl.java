package com.argorse.article.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.argorse.article.dao.ArticleDao;
import com.argorse.article.dao.impl.ArticleDaoImpl;
import com.argorse.article.domain.Article;
import com.argorse.article.service.ArticleService;

public class ArticleServiceImpl implements ArticleService {

	private ArticleDao articleDao = new ArticleDaoImpl();

	public void addArticle(Article a) throws SQLException {
		articleDao.addArticle(a);
	}


	public void delArticleById(String id) throws SQLException {
		articleDao.delArticleById(id);
	}


	public List findAllArticles() throws SQLException {
		return articleDao.findAllArticles();
	}


	public Article findArticleById(String id) throws SQLException {
		return articleDao.findArticleById(id);
	}


	public void updateArticle(Article a) throws SQLException {
		articleDao.updateArticle(a);
	}

	
	public List findArticleByMenuid(String menuid) throws SQLException {
		return articleDao.findArticleByMenuid(menuid);
	}
	
	public List selectArticleByMap(Map map) throws SQLException {
		return articleDao.selectArticleByMap(map);
	}

}
