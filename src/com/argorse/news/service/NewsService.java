package com.argorse.news.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.argorse.news.domain.News;

public interface NewsService {
	   public void insertNews(News news);//�������
	   
	   public void delNews(String id);//ɾ������
	   
	   public List selectNews();//��ѯ�����б�
	   
	   public News selectNewsById(String id);//���Id��ѯ����
	   
	   public void updateNews(News news);//��������
	   
	   public List selectNewsByMap(Map map) throws SQLException;//���Id��ѯ����
}
