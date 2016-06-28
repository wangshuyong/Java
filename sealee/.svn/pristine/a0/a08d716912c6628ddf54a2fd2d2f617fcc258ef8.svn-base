package com.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class StaticFreemarker {
	/**
	 * Freemarkerҳ�澲̬�����÷���
	 * @param ftl ģ��ҳ��
	 * @param htmlName ��̬��֮���ļ������(���׺)
	 * @param map ģ��ҳ�洫�ݼ�����ʾ�����
	 * @param fileName ģ��ҳ���ڵ�Ŀ¼(��WebRoot����һ����ʼ����)
	 * @param HttpServletRequest request
	 * @throws IOException ��������쳣
	 * @throws TemplateException ģ��ҳ�쳣
	 */
	public void init(String ftl,String htmlName,Map<Object, Object> map,String fileName, HttpServletRequest request) throws IOException, TemplateException
	{
		//��ʼ������
		Configuration freemarkerCfg = new Configuration();
		//���ü��ض�Ӧģ���λ��
		freemarkerCfg.setServletContextForTemplateLoading(request.getSession().getServletContext(), fileName);
		
		//����ʹ��UTF-8����
		freemarkerCfg.setEncoding(Locale.getDefault(), "UTF-8");
		
		Template template = freemarkerCfg.getTemplate(ftl);
		
		template.setEncoding("UTF-8");
		String path= request.getSession().getServletContext().getRealPath("/");
		BufferedWriter buff= new BufferedWriter(new FileWriter(path+htmlName));
		File htmlFile = new File(path+htmlName);
		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile), "UTF-8"));		
		template.process(map,out);
		buff.close();
		out.flush();
		out.close();
	}
}
