package com.web.action;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.dao.TAdvertiseDAO;
import com.web.form.AdvertiseForm;

public class EditAdvertiseAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdvertiseForm infoForm = (AdvertiseForm) form;
		TAdvertiseDAO infoDAO  = new TAdvertiseDAO();
		//上传广告图片
		try{
			FormFile imageFile = infoForm.getAdv_image();
			String filename = imageFile.getFileName();
			if(filename!=null&!filename.equals("")){
				infoForm.setImage(filename);
				InputStream stream = imageFile.getInputStream();//把文件读入
		        String filePath = request.getRealPath("/");//取当前系统路径
		        OutputStream bos = new FileOutputStream(filePath + "uploadFiles\\" + filename);//建立一个上传文件的输出流
		        int bytesRead = 0;
	            byte[] buffer = new byte[8192];
	            while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
	                bos.write(buffer, 0, bytesRead);// 将文件写入服务器
	            }
	            bos.close();
	            stream.close();
			}

		}catch(Exception e){
			e.printStackTrace();
		}
		
		infoDAO.doEdit(infoForm);
		request.setAttribute("type", infoForm.getAdv_type());
		return mapping.findForward("sucess");
	}
}
