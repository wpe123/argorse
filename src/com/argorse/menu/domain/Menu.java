package com.argorse.menu.domain;

public class Menu implements java.io.Serializable{

	private String id;
	private String name;
	private String pid;
	private Integer level ;
	private Integer isleaf;
	private String orderby;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getIsleaf() {
		return isleaf;
	}
	public void setIsleaf(Integer isleaf) {
		this.isleaf = isleaf;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
}
