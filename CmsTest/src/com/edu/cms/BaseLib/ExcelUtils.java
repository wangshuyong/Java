package com.edu.cms.BaseLib;

import java.io.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.*;
   
public class ExcelUtils {
   private XSSFSheet ExcelWSheet;
   private XSSFWorkbook ExcelWBook;
   private int      rowNum       = 0;
   private int      currentRowNo = 0;
//   private transient Collection<Object> data = null;
   //Constructor to connect to the Excel with sheetname and Path
   public ExcelUtils() {
	   /*
	  try 
	  {
		 // Open the Excel file
		 FileInputStream ExcelFile = new FileInputStream(Path);
		 // Access the required test data sheet
		 ExcelWBook = new XSSFWorkbook(ExcelFile);
		 ExcelWSheet = ExcelWBook.getSheet(SheetName); 
		 
		 //鑾峰彇鏂囦欢琛屾暟
		 rowNum = ExcelWSheet.getLastRowNum();
         Cell[] cell = ExcelWSheet.getRow(0);
         columnNum = cell.length;
         columnnName = new String[cell.length];

         for (int i = 0; i < cell.length; i++) {
             columnnName[i] = cell[i].getContents().toString();
         }
         this.currentRowNo++;
	   } 
	   catch (Exception e)
	   {
		   throw (e);           
	   }
	   */
   }
   
   @SuppressWarnings("null")
public Collection<Object> ReadExcelFile(String filePath, String sSheetName) {  
       XSSFRow row = null; 
       XSSFCell cell = null;
       XSSFSheet sheet = null;
       XSSFWorkbook wb;
       List<Object> rows = new ArrayList<Object>();
       List<Object> rowData = new ArrayList<Object>();
	   try {  
           FileInputStream fis = new FileInputStream(filePath);  
           wb = new XSSFWorkbook(fis);  
           sheet = wb.getSheet(sSheetName);  
           
           
//           data = new ArrayList<Object>();
//           Sheet sheet = workbook.getSheetAt(0);
           
           /*
           for (int i = 0; i < sheet.getPhysicalNumberOfRows(); i++) {  
        	   System.out.println("Row=" + i );                 
               row = sheet.getRow(i);  
               Iterator it = row.cellIterator();
               while (it.hasNext()) {
                   cell = (XSSFCell) it.next();  
                   try {  
                       cellNovalue = this.getCellValue(cell); 
                   } catch (Exception e3) {  
                       cellNovalue = "";  
                       e3.printStackTrace();  
                   }  
                      
                   System.out.print("Cell="  
                           + cell.getColumnIndex() + ",Value=" + cellNovalue +"; ");  
               }
               System.out.println("绗� + i+"琛岋紝"+"鍏辨湁"+columnNum +"鍒�); 
               columnNum=0;
               System.out.print("\n");
           }  */
       } catch (Exception e) {  
           e.printStackTrace();  
       }
//	return cellNovalue;
	   
	   for (int i = 0; i < sheet.getPhysicalNumberOfRows(); i++) { 
		   int numberOfColumns = countNonEmptyColumns(sheet);
		   row = sheet.getRow(i); 
            rowData.clear();      
            for (int column = 0; column < numberOfColumns; column++) {
             cell = row.getCell(column);
             rowData.add(this.getCellValue(cell));
            }         
            rows.add(rowData.toArray()); 
          }       
       return rows;
	   
   }
   
   public boolean hasNext() {
	   
       if (this.rowNum == 0 || this.currentRowNo >= this.rowNum) {

           try {
        	   ExcelWBook.close();
           } catch (Exception e) {
               e.printStackTrace();
           }
           return false;
       } else {
           // sheet涓嬩竴琛屽唴瀹逛负绌哄垽瀹氱粨鏉�
           if ((ExcelWSheet.getRow(currentRowNo)).getCell(0).equals(""))
               return false;
           return true;
       }
   }

   /*
    public Object[] next() {

	   XSSFRow c = ExcelWSheet.getRow(this.currentRowNo);
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
 */
   public void remove() {
       throw new UnsupportedOperationException("remove unsupported.");
   }
              
    //This method is to set the rowcount of the excel.
    public int excel_get_rows() throws Exception 
    {
	   try 
	   {
		   return ExcelWSheet.getPhysicalNumberOfRows();           
		} 
		catch (Exception e)
		{
			throw (e);
		
		}
    }
    
    public int excel_get_columns(Iterator it)
    {
    	int columnNum=0;
    	while (it.hasNext()) {
     	  columnNum ++; 
        }
    	return columnNum;
    }
    
    //This method to change the with the CellType.
    private Object getCellValue(XSSFCell cell) {       
        Object cellValue = null;
        DecimalFormat df = new DecimalFormat("#");
        switch (cell.getCellType()) {
            //This case to get the data and get the value as strings.
            case XSSFCell.CELL_TYPE_STRING:           	
                cellValue = cell.getRichStringCellValue().getString().trim();
                break;
            //This case to get the data and get the value as number.
            case XSSFCell.CELL_TYPE_NUMERIC:
                cellValue = df.format(cell.getNumericCellValue()).toString();
                break;
              //This case to get the data and get the value as boolean.
            case XSSFCell.CELL_TYPE_BOOLEAN:
                cellValue = String.valueOf(cell.getBooleanCellValue()).trim();
                break;
            case XSSFCell.CELL_TYPE_FORMULA:
                cellValue = cell.getCellFormula();
                break;
            default:
                cellValue ="空";
        }
        return cellValue;
    }     
    
    private boolean isEmpty(final Row row) {
        Cell firstCell = row.getCell(0);   
        boolean rowIsEmpty = (firstCell == null) || (firstCell.getCellType() == Cell.CELL_TYPE_BLANK);    
        return rowIsEmpty; 
       }
       
       private int countNonEmptyColumns(final Sheet sheet) {   
        Row firstRow = sheet.getRow(0);
        return firstEmptyCellPosition(firstRow);    
       }
       
       private int firstEmptyCellPosition(final Row cells) {  
        int columnCount = 0;
        
        for (Cell cell : cells) {     
         if (cell.getCellType() == Cell.CELL_TYPE_BLANK) {
          break;
         }
         columnCount++;    
        }    
        return columnCount;    
       }
        
}