package com.edu.cms.BaseLib;

import java.io.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.*;

public class ExcelUtils {
	private XSSFSheet ExcelWSheet;
	private XSSFWorkbook ExcelWBook;
	private int rowNum = 0;
	private int currentRowNo = 0;
	private int columns = 0;
	public ArrayList<String> arrkey = new ArrayList<String>();

	public ExcelUtils() {

	}

	@SuppressWarnings({ "null", "resource" })
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		// return cellNovalue;
		for (int r = 0; r < sheet.getPhysicalNumberOfRows(); r++) {
			int numberOfColumns = countNonEmptyColumns(sheet);
			row = sheet.getRow(r);
			rowData.clear();
			for (int column = 0; column < numberOfColumns; column++) {
				cell = row.getCell(column);
				rowData.add(this.getCellValue(cell));
			}
			rows.add(rowData.toArray());
		}
		return rows;

	}

	@SuppressWarnings("resource")
	public String[][] getDataForTestNG(String filePath, String sSheetName) {
		XSSFRow row = null;
		XSSFCell cell = null;
		XSSFSheet sheet = null;
		XSSFWorkbook wb;
		String[][] rows = null;
		try {
			FileInputStream fis = new FileInputStream(filePath);
			wb = new XSSFWorkbook(fis);
			sheet = wb.getSheet(sSheetName);

		} catch (Exception e) {
			e.printStackTrace();
		}
		rows=new String[sheet.getPhysicalNumberOfRows()][];
		// return cellNovalue;
		for (int r = 0; r < sheet.getPhysicalNumberOfRows(); r++) {
			int numberOfColumns = countNonEmptyColumns(sheet);
			row = sheet.getRow(r);
			rows[r] = new String[numberOfColumns];
			for (int column = 0; column < numberOfColumns; column++) {
				cell = row.getCell(column);
				rows[r][column] =(String) this.getCellValue(cell);
//				cell.getStringCellValue();
			}
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

	public void remove() {
		throw new UnsupportedOperationException("remove unsupported.");
	}

	// This method is to set the rowcount of the excel.
	public int excel_get_rows() throws Exception {
		try {
			return ExcelWSheet.getPhysicalNumberOfRows();
		} catch (Exception e) {
			throw (e);

		}
	}

	public int excel_get_columns(Iterator it) {
		int columnNum = 0;
		while (it.hasNext()) {
			columnNum++;
		}
		return columnNum;
	}

	// This method to change the with the CellType.
	private Object getCellValue(XSSFCell cell) {
		Object cellValue = null;
		DecimalFormat df = new DecimalFormat("#");
		switch (cell.getCellType()) {
		// This case to get the data and get the value as strings.
		case XSSFCell.CELL_TYPE_STRING:
			cellValue = cell.getRichStringCellValue().getString().trim();
			break;
		// This case to get the data and get the value as number.
		case XSSFCell.CELL_TYPE_NUMERIC:
			cellValue = df.format(cell.getNumericCellValue()).toString();
			break;
		// This case to get the data and get the value as boolean.
		case XSSFCell.CELL_TYPE_BOOLEAN:
			cellValue = String.valueOf(cell.getBooleanCellValue()).trim();
			break;
		case XSSFCell.CELL_TYPE_FORMULA:
			cellValue = cell.getCellFormula();
			break;
		default:
			cellValue = "空";
		}
		return cellValue;
	}

	private boolean isEmpty(final Row row) {
		Cell firstCell = row.getCell(0);
		boolean rowIsEmpty = (firstCell == null)
				|| (firstCell.getCellType() == Cell.CELL_TYPE_BLANK);
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

	/**
	 * 获得excel文件的路径
	 * 
	 * @return
	 * @throws IOException
	 */
	/*public String getPath() throws IOException {
		File directory = new File(".");
		sourceFile = directory.getCanonicalPath() + "\\src\\resources\\"
				+ fileName + ".xls";
		return sourceFile;
	}*/
}