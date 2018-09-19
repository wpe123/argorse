package com.argorse.article.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.argorse.article.dao.ArticleDao;
import com.argorse.article.domain.Article;
import com.argorse.util.BaseDao;

public class ArticleDaoImpl extends BaseDao implements ArticleDao {

	public void addArticle(Article a) throws SQLException {
		this.getSqlMapClient().insert("Article.addArticle", a);
	}

	public void delArticleById(String id) throws SQLException {
		this.getSqlMapClient().delete("Article.delArticleById", id);
	}

	public List findAllArticles() throws SQLException {
		return this.getSqlMapClient().queryForList("Article.findAllArticle");
	}

	public Article findArticleById(String id) throws SQLException {
		return (Article)this.getSqlMapClient().queryForObject("Article.findArticleById",id);
	}

	public void updateArticle(Article a) throws SQLException {
		this.getSqlMapClient().update("Article.updateArticle", a);
	}

	public List findArticleByMenuid(String menuid) throws SQLException {
		List list = this.getSqlMapClient().queryForList("Article.findArticleByMenuid", menuid);
		return list;
		
	}
	public List selectArticleByMap(Map map) throws SQLException {
		List list = this.getSqlMapClient().queryForList("Article.selectArticleByMap", map);
		return list;
	}

}
