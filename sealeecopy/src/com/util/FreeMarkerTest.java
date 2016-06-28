package com.util;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import freemarker.template.*;
public class FreeMarkerTest {

	private final Log logger=LogFactory.getLog(getClass());
	private Configuration freemarker_cfg = null;
	//static String sGeneFilePath = "D:\\MyEclipse 5.5.1 GA\\workspace\\jeree\\WebRoot\\templates";
	//static String sGeneFileName = "freemarker.htm";
	//static String sTempPlateFilePath = "D:\\MyEclipse 5.5.1 GA\\workspace\\jeree\\WebRoot\\templates";
	
	/*public static void main(String args[]){
		com.util.NewsItem aItem =new com.util.NewsItem();
		aItem.loadData();
		FreeMarkerTest test = new FreeMarkerTest();
		Map root = new HashMap();
		root.put("newsitem", aItem);
		//boolean bOK=test.geneHtmlFile("template.ftl",root,sGeneFilePath,sGeneFileName);
		
	}*/
	protected Configuration getFreeMarkerCFG(String sTempPlateFilePath){
		
		if(null==freemarker_cfg){
			freemarker_cfg = new Configuration();
			freemarker_cfg.setClassForTemplateLoading(this.getClass(),"/htmlskin");
			try{
				freemarker_cfg.setDirectoryForTemplateLoading(new File(sTempPlateFilePath));
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return freemarker_cfg;
	}
	
	public boolean geneHtmlFile(String templatePath,String templateFileName,Map propMap,String htmlFilePath,String htmlFileName){
		
		try{
			Template t = getFreeMarkerCFG(templatePath).getTemplate(templateFileName);
		    creatDirs(htmlFilePath);
		    File afile = new File(htmlFilePath+"/"+htmlFileName);
		    //设置生成的文件编码为UTF-8
		    //Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(afile),"utf-8"));
		    //服务器不支持UTF-8格式HTML时候使用ANSI格式HTML文件，即系统默认编码
		    Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(afile)));
		    t.process(propMap, out);
		}catch(TemplateException e){
			logger.error("Error while processing FreeMarker template"+templateFileName,e);
		    return false;
		}catch(IOException e){
			logger.error("Error while generate Static Html File"+htmlFileName,e);
		    return false;
		}
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
