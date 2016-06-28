package com.edu.cms.BaseLib;

 import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.poi.hslf.model.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.testng.Assert;
 
 /**
  * Excel鏀惧湪Data鏂囦欢澶逛笅</p>
  * Excel鍛藉悕鏂瑰紡锛氭祴璇曠被鍚�xls</p>
  * Excel鐨剆heet鍛藉悕鏂瑰紡锛氭祴璇曟柟娉曞悕</p>
  * Excel绗竴琛屼负Map閿�</p>
  * 浠ｇ爜鍙傝�閮戦缚蹇楃殑Blog
  * {@link www.zhenghongzhi.cn/post/42.html}
  * @ClassName: ExcelDataProvider
  * @Description: TODO(璇诲彇Excel鏁版嵁)
  * 鍑嗗锛氭柊寤轰竴涓猠xcel鏂囦欢锛屾枃浠跺悕涓烘祴璇曠被鍚嶏紝sheet鍚嶄负娴嬭瘯鏂规硶鍚峞xcel绗竴琛屼负鏍囬锛屼粠绗簩琛屽紑濮嬩负娴嬭瘯鏁版嵁
  */
 public class FileUtils implements Iterator<Object[]> {
 
     private Workbook book         = null;
     private Sheet    sheet        = null;
     private int      rowNum       = 0;
     private int      currentRowNo = 0;
     private int      columnNum    = 0;
     private String[] columnnName;
 
     public FileUtils(String classname, String methodname) {
 
         try {
 
             int dotNum = classname.indexOf(".");
 
             if (dotNum > 0) {
                 classname = classname.substring(classname.lastIndexOf(".") + 1,
                         classname.length());
             }
             //浠�data鏂囦欢澶逛笅璇诲彇浠ョ被鍚嶅懡鍚嶇殑excel鏂囦欢
             String path = "data/" + classname + ".xls";
             InputStream inputStream = new FileInputStream(path);
 
             book = Workbook.getWorkbook(inputStream);
             //鍙杝heet
             sheet = book.getSheet(methodname);
             rowNum = sheet.getRows();
             Cell[] cell = sheet.getRow(0);
             columnNum = cell.length;
             columnnName = new String[cell.length];
 
             for (int i = 0; i < cell.length; i++) {
                 columnnName[i] = cell[i].getContents().toString();
             }
             this.currentRowNo++;
 
         } catch (Exception e) {
             e.printStackTrace();
             Assert.fail("unable to read Excel data");
         }
     }
 
     public boolean hasNext() {
 
         if (this.rowNum == 0 || this.currentRowNo >= this.rowNum) {
 
             try {
                 book.close();
             } catch (Exception e) {
                 e.printStackTrace();
             }
             return false;
         } else {
             // sheet涓嬩竴琛屽唴瀹逛负绌哄垽瀹氱粨鏉�
             if ((sheet.getRow(currentRowNo))[0].getContents().equals(""))
                 return false;
             return true;
         }
     }

     public Object[] next() {

         Cell[] c = sheet.getRow(this.currentRowNo);
         Map<String, String> data = new HashMap<String, String>();
         // List<String> list = new ArrayList<String>();

         for (int i = 0; i < this.columnNum; i++) {
 
             String temp = "";
 
             try {
                 temp = c[i].getContents().toString();
             } catch (ArrayIndexOutOfBoundsException ex) {
                 temp = "";
             }
 
             // if(temp != null&& !temp.equals(""))
             // list.add(temp);
             data.put(this.columnnName[i], temp);
         }
         Object object[] = new Object[1];
         object[0] = data;
         this.currentRowNo++;
         return object;
     }
 
     public void remove() {
         throw new UnsupportedOperationException("remove unsupported.");
     }
}
