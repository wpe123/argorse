package com.argorse.news.domain;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class ImageForm extends ActionForm{
	private FormFile img_path;

	public FormFile getImg_path() {
		return img_path;
	}

	public void setImg_path(FormFile img_path) {
		this.img_path = img_path;
	}
}
