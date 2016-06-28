package com.sea.util;

import java.io.*;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class FileUtils {
	private String fileName ="";
   	private String newFIleName = "";
   	private FileInputStream inputStream =null;
   	private FileOutputStream outputStream = null;
   	private String newpath = "";
    private static Properties props = null;
    private final static String file_CONFIG="file.properties";
     //唯一实例
    private static FileUtils m_instance = new FileUtils();
     // 私有构造函数
    private FileUtils() {
    	try {
            props = new Properties();
            InputStream in = FileUtils.class.getClassLoader().getResourceAsStream(file_CONFIG);
            props.load(in);
        } catch (Exception e) {
//        	System.out.println(ConfigurationSettings.class.);
            throw new RuntimeException("ConfigurationSettings initialize failed.", e);
        }	
    }
    public synchronized static FileUtils getInstance() {
        return m_instance;
    }

   public String getProperty(String propertyName){
       return props.getProperty(propertyName);
   }
   
   public String fileUpload (File file, String fileFileName,String path) {
	   	File upload = new File(path); 
	   	// 判断文件夹是否存在,如果不存在则创建文件夹
	   	if (!upload.exists()) {
	   		upload.mkdir();
	   	}
	   	try {
	    	if (file != null) {
		    	File f = file;
		    	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		    	fileName = df.format(System.currentTimeMillis());//文件名为上传时间
		    	newFIleName = fileName+"_"+ fileFileName; // 保存在硬盘中的文件名 上传时间+原文件名
		    	inputStream = new FileInputStream(f);
		    	outputStream = new FileOutputStream(path+ "\\" + newFIleName);
		    	byte[] buf = new byte[1024];
		    	int length = 0;
		    	while ((length = inputStream.read(buf)) != -1) {
		    		outputStream.write(buf, 0, length);
		    	}
		    	inputStream.close();
		    	outputStream.flush();
		    	newpath = path+"\\"+newFIleName;
	    	}
	   	} catch (Exception e) {
	   		e.printStackTrace();
		}
	return newpath;
   }
 
}