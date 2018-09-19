package com.argorse.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import com.argorse.news.domain.ImageForm;

public class uploadImg {
	private String filename;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public static  String upload(ActionForm form,HttpServletRequest request) {
		
		File foler = new File(request.getSession().getServletContext().getRealPath(
				"/userfiles/upload_img"));
		
		if(!foler.exists()){
			foler.mkdirs();
		}
		ImageForm forms = (ImageForm) form;
		FormFile files = forms.getImg_path();
		String filename = files.getFileName();
		if(null==filename||"".equals(filename)){return null;}
		String randname = Calendar.HOUR + "" + Calendar.MINUTE + ""
				+ Calendar.SECOND + Calendar.MILLISECOND;
		String path = request.getSession().getServletContext().getRealPath(
				"/userfiles/upload_img/" + randname + filename);
		byte[] fileData;
		try {
			fileData = files.getFileData();
			FileOutputStream out = new FileOutputStream(new File(path));
			out.write(fileData);
			out.close();
			files.getContentType();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return randname + filename;
	}
	
}
