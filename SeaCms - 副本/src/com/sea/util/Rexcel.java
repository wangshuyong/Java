package com.sea.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.DVConstraint;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataValidation;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationConstraint.OperatorType;
import org.apache.poi.ss.usermodel.DataValidationConstraint.ValidationType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDataValidationHelper;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Rexcel {
	 private StringBuffer errorMessage;  //解析Excel文件时遇到的错误信息，用于存储错误单元格的位置信息和错误原因
	    
	    /**
	     * 读入Excel文件，解析单元格内容，并存入二维数组
	     * @param fileInputStream
	     * @return String类型的二维数组
	     * @throws ExcelException 
	     */
	    public ArrayList<ArrayList<String>> readExcel(FileInputStream fileInputStream) throws Exception {

	        //声明并初始化一个工作薄对象
	        Workbook wb = null;
	        //存储解析后的Excel中的内容的二维数组
	        ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();

	        try {
	            //生成Excel工作薄对象
	            wb = WorkbookFactory.create(fileInputStream);
	            
	            //获得工作薄中的第一个工作表
	            Sheet sheet = wb.getSheetAt(0);

	            //调用readRows方法，逐行解析工作表中内容
	            list = readRows(sheet); 

	            //解析Excel文件结束后，关闭输入流
	            fileInputStream.close();
	        
	        } catch(Exception e){
	            e.printStackTrace();
	        }

	        return list;
	    }

	    /**
	     * 逐行解析工作表中的内容
	     * @param sheet
	     * @return 解析工作表后生成的二维数组
	     * @throws Exception
	     */
	    private ArrayList<ArrayList<String>> readRows(Sheet sheet) {

	        //声明并初始化String类型的二维数组，用于存储解析后的工作表中的内容
	        ArrayList<ArrayList<String>> list= new ArrayList<ArrayList<String>>();

	        //获得该工作表的行数
	        int rows = sheet.getPhysicalNumberOfRows();
	        int rowIndex = 0;        //每行索引
	        int notnullRowIndex = 0; //非空行索引
	        while (notnullRowIndex < rows) {
	            //解析该行中的每个单元格
	            Row row = sheet.getRow(rowIndex);
	            rowIndex++;
	            if (row != null) {
	                //将每行解析出的一维数组加入到list中
	                list.add(readCells(row));
	                notnullRowIndex++;
	            }
	        }
	        return list;
	    }   

	    /**
	     * 解析工作表中的一行数据
	     * @param row
	     * @return 本行解析后的一维数组
	     * @throws Exception
	     */
	    private ArrayList<String> readCells(Row row) {

	        //获得本行所有单元格
	        int cells  = row.getPhysicalNumberOfCells();
	        int cellIndex = 0;         //单元格索引
	        int notnullCellIndex = 0;  //非空单元格索引

	        //声明并初始化一个一维数组，用于存储改行解析后的数据
	        ArrayList<String> rowlist = new ArrayList<String>();

	        //逐个解析该行的单元格
	        while(notnullCellIndex < cells) {

	            //取得一个单元格
	            Cell cell = row.getCell(cellIndex);
	            

	            cellIndex++;
	            if (cell != null) {
	                String value = null;
	                SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	       		 	DecimalFormat df = new DecimalFormat("#");
	                //根据单元格内容的类型分别处理
	                switch (cell.getCellType()) {                                   
	                case Cell.CELL_TYPE_FORMULA:   
	                    value = cell.getCellFormula();   
	                    break; 
	                case Cell.CELL_TYPE_NUMERIC:
		                if(DateUtil.isCellDateFormatted(cell)) {
		                	value = fmt.format(cell.getDateCellValue()); //日期型
		                 }
		                 else {
		                	 value = String.valueOf(cell.getNumericCellValue()); //数字
		                 }
		                 break;
	                case Cell.CELL_TYPE_STRING:   
	                    value = cell.getStringCellValue();   
	                    break;                
	                case Cell.CELL_TYPE_BLANK:   
	                    value = "";                            
	                    break;
	                default: {
	                    //若单元格内容的格式与常规类型不符，则记录下单元格位置，并跳过该行的读取，继续解析下一行
	                    errorMessage.append(row.getRowNum()+"行"+notnullCellIndex+"列"+"格式与常规类型不符;");
	                    return null;
	                }  
	                }   
	                notnullCellIndex++;
	                //将该单元格的内容存入一维数组
	                rowlist.add(value); 
	            }
	        } 
	        errorMessage.append("ok");
	        return rowlist;
	    }

	    
	    /**
	     * 根据传入的list和文件名生成Excel文件
	     * 保存到target/temp文件夹中，下载完毕后删除临时文件
	     * @param list
	     */
	    public XSSFWorkbook writeExcel(ArrayList<ArrayList<String>> list){
	        
	        //实例化工作薄对象
	        XSSFWorkbook wb = new XSSFWorkbook();
	        //创建一个工作表
	        XSSFSheet sheet = wb.createSheet();
	        //设置单元格的格式
	        XSSFCellStyle style = wb.createCellStyle();
//	        style.setFillBackgroundColor(new XSSFColor(Color.WHITE));
	        style.setFillPattern(XSSFCellStyle.NO_FILL);
	        
	        for(int i = 0;i < list.size();i++){
	            //创建一行
	            XSSFRow row = sheet.createRow(i);
	            
	            ArrayList<String> rowlist = list.get(i);
	            for(int j = 0;j < rowlist.size();j++){
	                //创建一个单元格，并根据数组中的内容填充该单元格
	                XSSFCell cell = row.createCell(j);
	                cell.setCellType(Cell.CELL_TYPE_STRING);
	                cell.setCellStyle(style);
	                cell.setCellValue(rowlist.get(j));
	            }
	        }
	        
	        return wb;
	    }
	    /**
	     * 根据传入的list和文件名生成Excel文件
	     * 保存到target/temp文件夹中，下载完毕后删除临时文件
	     * 并设置数据的有效性
	     * 崔
	     * @param list
	     */
	    public HSSFWorkbook writeExcel(ArrayList<ArrayList<String>> list,HSSFDataValidation dataValidation){
	        // 取得规则  
	        //实例化工作薄对象
	        HSSFWorkbook wb = new HSSFWorkbook();  
	        //创建一个工作表
	        HSSFSheet sheet = wb.createSheet();  
	        //设置单元格的格式
	        sheet.addValidationData(dataValidation);
	        HSSFCellStyle style = wb.createCellStyle();
	        style.setFillPattern(HSSFCellStyle.NO_FILL);
	        
	        for(int i = 0;i < list.size();i++){
	            //创建一行
	            HSSFRow row = sheet.createRow(i);
	            
	            ArrayList<String> rowlist = list.get(i);
	            for(int j = 0;j < rowlist.size();j++){
	                //创建一个单元格，并根据数组中的内容填充该单元格
	                HSSFCell cell = row.createCell(j);
	                cell.setCellType(Cell.CELL_TYPE_STRING);
	                cell.setCellStyle(style);
	                cell.setCellValue(rowlist.get(j));
	            }
	        }
	        
	        return wb;
	    }
	    /**
	     * 设置舒服的有效性
	     * 崔
	     * @param firstRow 起始行
	     * @param firstCol 终止行
	     * @param endRow   起始列
	     * @param endCol   终止列 
	     * @return
	     */
	    public  HSSFDataValidation setDataValidationView(short firstRow,short firstCol,short endRow, short endCol){  
	        //构造constraint对象   
	        DVConstraint constraint=DVConstraint.createCustomFormulaConstraint("B1");  
	        //四个参数分别是：起始行、终止行、起始列、终止列   
	        CellRangeAddressList regions=new CellRangeAddressList(firstRow,firstCol,endRow,endCol);  
	        //数据有效性对象   
	        HSSFDataValidation data_validation_view = new HSSFDataValidation(regions, constraint);  
	         
	        return data_validation_view;  
	    } 
	    /**
	     * 设置舒服的有效性
	     * 崔
	     * @param firstRow 起始行
	     * @param firstCol 终止行
	     * @param endRow   起始列
	     * @param endCol   终止列 
	     * @return
	     */
	    public static HSSFDataValidation setDataValidationList(short firstRow,short firstCol,short endRow, short endCol){  
	        //设置下拉列表的内容   
	        String[] textlist={"是","否"};  
	         
	        //加载下拉列表内容   
	        DVConstraint constraint=DVConstraint.createExplicitListConstraint(textlist);  
	        //设置数据有效性加载在哪个单元格上。   
	         
	        //四个参数分别是：起始行、终止行、起始列、终止列   
	        CellRangeAddressList regions=new CellRangeAddressList(firstRow,firstCol,endRow,endCol);  
	        //数据有效性对象   
	        HSSFDataValidation data_validation_list = new HSSFDataValidation(regions, constraint);  
	         
	        return data_validation_list;  
	    }  
	    public static DataValidation setValidate(XSSFSheet sheet, short beginRow,  
	            short beginCol, short endRow, short endCol) {  
	        XSSFDataValidationHelper helper = new XSSFDataValidationHelper(sheet);  
	        DataValidationConstraint constraint = helper.createNumericConstraint(  
	                ValidationType.INTEGER, OperatorType.BETWEEN, "1", "100");  
	        CellRangeAddressList regions = new CellRangeAddressList(beginRow,  
	                beginCol, endRow, endCol);  
	        return helper.createValidation(constraint, regions);  
	    }  
	    
	    public StringBuffer getErrorMessage() {
	        return errorMessage;
	    }

	    public void setErrorMessage(StringBuffer errorMessage) {
	        this.errorMessage = errorMessage;
	    }
	   /**
	    public void importUserToDB(ArrayList<ArrayList<String>> list)
	            throws Exception {
	        if(list.size() < 1){
	            errorMessage.append("用户excel文件中没有数据！");
	        }
	        if(list.get(0).size() != 7 ){
	        	errorMessage.append("用户excel文件中的列数不正确！");
	        }
	        if(!list.get(0).get(0).equals("用户名")){
	        	errorMessage.append("用户excel文件中的第一列应该为“用户名”！");
	        }
	        if(!list.get(0).get(1).equals("性别")){
	        	errorMessage.append("用户excel文件中的第二列应该为“性别”！");
	        }
	        if(!list.get(0).get(2).equals("邮箱")){
	        	errorMessage.append("用户excel文件中的第三列应该为“邮箱”！");
	        }
	        if(!list.get(0).get(3).equals("电话")){
	        	errorMessage.append("用户excel文件中的第四列应该为“电话”！");
	        }
	        if(!list.get(0).get(4).equals("部门")){
	        	errorMessage.append("用户excel文件中的第五列应该为“部门”！");
	        }
	        if(!list.get(0).get(5).equals("职位")){
	        	errorMessage.append("用户excel文件中的第六列应该为“职位”！");
	        }
	        if(!list.get(0).get(6).equals("角色")){
	        	errorMessage.append("用户excel文件中的第七列应该为“角色”！");
	        }
	        for(int i=1; i < list.size(); ++i){
	            int index = i+1;
	                        
	            UserBean user = new UserBean();
	            //第一列：用户名处理
	            String firstColumn = list.get(i).get(0);
	            if(firstColumn.equals("")){
	                setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第1列“用户名”为空，该行导入失败。<br> ");
	                continue;
	            }else{
	                if(firstColumn.length() > 20){            //长度过大
	                    setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第1列“用户名”长度大于20，该行导入失败。<br> ");
	                    continue;
	                }
	                
	                    user.setUserName(firstColumn);
	                
	            }
	            //第二列：性别处理
	            String secondColumn = list.get(i).get(1);
	            if(firstColumn.equals("")){
	                setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第2列“性别”为空，该行导入失败。<br> ");
	                continue;
	            }else{
	                if((!secondColumn.equals("男"))&&(!secondColumn.equals("女"))){            //长度过大
	                    setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第2列“性别”填写错误，该行导入失败。<br> ");
	                    continue;
	                }
	            boolean gender1 = false;            
	            if(secondColumn.equals("男")){
	                gender1=true;
	            }
	            user.setGender(gender1);
	                
	            }
	            
	            //第三列：邮箱处理
	            String thirdColumn = list.get(i).get(2);
	            if(thirdColumn.equals("")){
	                setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第3列“邮箱”为空，该行导入失败。<br> ");
	                continue;
	            }else{
	                Pattern p = Pattern.compile("(^([\\w-.]+)@csljc.com$)");
	                Matcher m = p.matcher(thirdColumn);
	                if(thirdColumn.length()>50){
	                    setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第3列“邮箱”超过50个字符，该行导入失败。<br> ");
	                    continue;
	                }else{
	                if (!m.find()){
	                    setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第3列“邮箱”不符合公司标准，该行导入失败。<br> ");
	                    continue;
	                }else{
	                    if(userDao.existUser(thirdColumn)){
	                        setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第3列该“邮箱”对应用户已存在，该行导入失败。<br> ");
	                        continue;
	                    }
	                    user.setEmail(thirdColumn);
	                }
	                }
	            }
	            
	            //第四列：电话校验
	            String forthColumn = list.get(i).get(3);
	            if(forthColumn.length()>11){
	                setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第4列“电话”长度超过11位，该行导入失败。<br> ");
	                continue;
	            }else{
	            user.setTEL(forthColumn);
	            }
	            //第五列：部门校验
	            String fifthColumn = list.get(i).get(4);
	            if(fifthColumn.equals("")){
	                setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第5列“部门”为空，该行导入失败。<br> ");
	                continue;
	            }else {
	                DepartmentBean dp = departmentDao.findByName(fifthColumn);
	                if(dp == null){            //该类型在数据库中是否存在
	                    setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第5列中的“部门”不正确，该行导入失败。<br> ");
	                    continue;
	                }
	                user.setDepartmentID(dp);
	            }
	            //第六列：职位校验
	            String sixthColumn = list.get(i).get(5);
	            if(sixthColumn.equals("")){
	                setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第6列“职位”为空，该行导入失败。<br> ");
	                continue;
	            }else {
	                PositionBean pt = positionDao.findByName(sixthColumn);
	                if(pt == null){            //该类型在数据库中是否存在
	                    setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第6列中的“职位”不正确，该行导入失败。<br> ");
	                    continue;
	                }
	                user.setPositionID(pt);
	            }
	            //第七列：角色校验
	            String seventhColumn = list.get(i).get(6);
	            if(seventhColumn.equals("")){
	                setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第7列“角色”为空，该行导入失败。<br> ");
	                continue;
	            }else {
	                RoleBean role = roleDao.findByName(seventhColumn);
	                if(role == null){            //该类型在数据库中是否存在
	                    setImportErrorMess(getImportErrorMess()+"第"+ index + "行，第7列中的“角色”不正确，该行导入失败。<br> ");
	                    continue;
	                }
	                user.setRole(role);
	            }
	                                        
	                user.setPassword(list.get(i).get(2));
	                user.setCreaterID(modifyedBy);
	                user.setCreateTime(new Date());
	                user.setEmployed(true);
	                
	                this.userDao.addUser(user);
	        }
	    }
	    **/
}
