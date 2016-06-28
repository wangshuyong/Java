package com.util;
import java.io.*;
//import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import freemarker.template.*;
public class FreeMarkerTest {

	private final Log logger=LogFactory.getLog(getClass());

	public boolean geneHtmlFile(String ftl,String htmlName,Map<Object, Object> map,String templatepath,String htmlpath, HttpServletRequest request) throws IOException, TemplateException
	{
		
		//��ʼ������
		Configuration freemarkerCfg = new Configuration();
		//���ü��ض�Ӧģ���λ��
		freemarkerCfg.setServletContextForTemplateLoading(request.getSession().getServletContext(), templatepath);
		
		//����ʹ��UTF-8����
		freemarkerCfg.setEncoding(Locale.getDefault(), "UTF-8");
		
		Template template = freemarkerCfg.getTemplate(ftl);
		
		template.setEncoding("UTF-8");
		
		
//		String path="E:\\workspace\\work\\sealee\\WebRoot\\html\\1000\\";
//				request.getSession().getServletContext().getRealPath("/");
		 creatDirs(htmlpath);
		 
		BufferedWriter buff= new BufferedWriter(new FileWriter(htmlpath+"\\"+htmlName));
		File htmlFile = new File(htmlpath+htmlName);
		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile),"UTF-8"));		
		template.process(map,out);
		buff.close();
		out.flush();
		out.close();
		return true;
	}
	
	public static boolean creatDirs(String path){
		
		File aFile = new File(path);
		if(!aFile.exists()){
			return aFile.mkdirs();
		}else{
			return true;
		}
	}
}
