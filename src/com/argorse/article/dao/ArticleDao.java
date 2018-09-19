package com.argorse.article.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.argorse.article.domain.Article;

public interface ArticleDao {

	public void addArticle(Article a) throws SQLException;
	
	public void delArticleById(String id) throws SQLException;
	
	public void updateArticle(Article a) throws SQLException;
	
	@SuppressWarnings("unchecked")
	public List findAllArticles() throws SQLException;
	
	public Article findArticleById(String id) throws SQLException;
	public List findArticleByMenuid(String menuid) throws SQLException;
	public List selectArticleByMap(Map map) throws SQLException;
}
