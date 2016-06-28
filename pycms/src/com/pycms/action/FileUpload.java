package com.pycms.action;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.pycms.framework.ActionSupportBase;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class FileUpload extends ActionSupportBase {

    private static final long serialVersionUID = 572146812454l ;
    private static final int BUFFER_SIZE = 16 * 1024 ;
    private Object  data;
    private File[] file;
    private ArrayList<Object> uploadErrors;
	public Map<String, Object> reqdata = new HashMap<String, Object>();
	
    
	
	
	public ArrayList<Object> getUploadErrors() {
		return uploadErrors;
	}
	public void setUploadErrors(ArrayList<Object> uploadErrors) {
		this.uploadErrors = uploadErrors;
	}
	public Map<String, Object> getReqdata() {
		return reqdata;
	}
	public void setReqdata(Map<String, Object> reqdata) {
		this.reqdata = reqdata;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	
    public File[] getFile() {
		return file;
	}
	public void setFile(File[] file) {
		this.file = file;
	}
	public String image()   {
		System.out.println("上传消息图片");
		init();
		JSONObject json = new JSONObject();
		try {
			String state = this.getParameter("state");
				if (file!=null)
				{
					for (int i = 0; i < file.length; i++) {
						
						
						System.out.println(file[i].getAbsolutePath());
						System.out.println(file[i].getCanonicalPath());
						System.out.println(file[i].getName());
						System.out.println(file[i].getPath());
						System.out.println(file[i].getFreeSpace());
						System.out.println(file[i].getParent());
						System.out.println(file[i].getTotalSpace());
						System.out.println(file[i].getUsableSpace());
						System.out.println(file[i].getParentFile());
						System.out.println(file[i].getAbsoluteFile());
					
						json.put("name", file[i].getName());
						json.put("id",  file[i].getName());
						
						MultiPartRequestWrapper mrequest = (MultiPartRequestWrapper) request;
						
						File[] multipartFiles = mrequest.getFiles("file");
						InputStream filesstrea=new FileInputStream(mrequest.getFiles("file")[i]);
						String fspath = "";
						//下载文件到本地
						for (File file : multipartFiles) {
							InputStream stream = new FileInputStream(file);
						
							 String path = request.getSession().getServletContext().getRealPath("/");
			
							fspath = path+ "files\\img\\"+file.getName();
							System.out.println("fspath=" + fspath);
							deletefile(fspath);
							FileOutputStream fs = new FileOutputStream(fspath);
							byte[] buffer = new byte[1024 * 1024];
							int bytesum = 0;
							int byteread = 0;
							while ((byteread = stream.read(buffer)) != -1) {
								bytesum += byteread;
								fs.write(buffer, 0, byteread);
								fs.flush();
							}
						
						} 
						
						
					}
					
			}

				JSONObject success = new JSONObject();
				reqdata.put("file", json);
				reqdata.put("success", "success");
				System.out.println("reqdata"+reqdata.toString());
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return SUCCESS; 	
		
	}
    
	/**
	 * 保存上传文件
	 * @param strHome
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	private String SaveUploadFile(String strHome) throws UnsupportedEncodingException 
	{
		String theSavePath = "";
		String folderRoot = strHome;
		String saveFolder = "TransferFiles";
		String rootPath = folderRoot+"\\"+saveFolder;
		
		File theRootPahtDir = new File(rootPath);
		if(!theRootPahtDir.exists())
		{
			theRootPahtDir.mkdirs();
		}
		theSavePath = rootPath;
		String fileId = this.getParameter("id");
		File imageFile = new File(theSavePath+"\\"+fileId);
		if (imageFile.exists()==false)
		{
//			copy(file, theSavePath+"\\"+fileId);
		}
		return theSavePath;
	}
	
	
	/**
	 * 复制
	 * @param from
	 * @param strFullFilePath
	 */
	 private static void copy(File from, String strFullFilePath) 
	 {
		 File to = new File(strFullFilePath+".tmp");	//临时文件
		 InputStream in = null;
		 OutputStream out =null;
		 try {
			in = new BufferedInputStream(new FileInputStream(from));
			out = new BufferedOutputStream(new FileOutputStream(to));
			
			byte[] b = new byte[1024];
			int len = 0;
			while ((len=in.read(b))>0)
			{
				out.write(b, 0, len);
			}
			out.flush();
			out.close();
			in.close();
			
			File targetFile = new File(strFullFilePath);
			to.renameTo(targetFile);
		} catch (Exception e) {
			// TODO: handle exception
		}
		 finally
		{
			 if(in !=null)
			 {
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(out!=null)
			 {
				 try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
		}
	 }
	
	 public void QuickSend(String strDesc) 
	   {
		 response.setContentType("text/xml;charset=UTF-8");
		 response.setHeader("Cache-control", "no-cahe");
		 
		 byte[] b ;
		 try {
			b = strDesc.getBytes("UTF-8");
			int LEN = b.length;
			response.setContentLength(LEN);
			String strOutText = new String(b, "UTF-8");
			PrintWriter out = null;
			out=response.getWriter();
			out.write(strOutText);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   }
	 
	 
	 /**
	     * 创建等比缩放图
	     * */
	    public static boolean createThumbnail(String src,String dist) {
			try {
				File srcfile = new File(src);
				if (!srcfile.exists()) {
					//System.out.println("文件不存在");
					return false;
				}
				BufferedImage image = ImageIO.read(srcfile);

				// 获得缩放的比例
				double ratio = 0.0;
				if (image.getHeight() > 400 || image.getWidth() > 400) {
					if (image.getHeight() > image.getWidth()) {
						ratio = 400.0 / image.getHeight();
					} else {
						ratio = 400.0 / image.getWidth();
					}
				}
				// 计算新的图面宽度和高度
				int newWidth = (int) (image.getWidth() * ratio);
				int newHeight = (int) (image.getHeight() * ratio);
				
				if (ratio == 0.0) 
				{
					newWidth = (int)image.getWidth();
					newHeight = (int)image.getHeight();
			    }

				BufferedImage bfImage = new BufferedImage(newWidth, newHeight,
						BufferedImage.TYPE_INT_RGB);
				bfImage.getGraphics().drawImage(
						image.getScaledInstance(newWidth, newHeight,
								Image.SCALE_SMOOTH), 0, 0, null);

				FileOutputStream os = new FileOutputStream(dist);
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
				encoder.encode(bfImage);
				os.close();
				//System.out.println("创建缩略图成功");
				return true;
			} catch (Exception e) {
				System.out.println("创建缩略图"+dist+"发生异常: " + e.getMessage());
			}
			return false;
		}
	    
	    
	    /*
		 * deletefile
		 * 删除文件夹及文件夹里的所有文件
		 * delpath  文件路径
		 */
		public boolean deletefile(String delpath) {
			try {
				File file = new File(delpath);
				if (!file.isDirectory()) {
					
					file.delete();
				} else if (file.isDirectory()) {
				
					String[] filelist = file.list();
					for (int i = 0; i < filelist.length; i++) {
						File delfile = new File(delpath + "\\" + filelist[i]);
						if (!delfile.isDirectory()) {
							delfile.delete();
						} else 
//							if (delfile.isDirectory())
						{
							deletefile(delpath + "\\" + filelist[i]);
						}
					}
					file.delete();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		}
}
