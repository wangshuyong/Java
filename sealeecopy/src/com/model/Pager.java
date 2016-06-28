package com.model;

import java.util.Map;

public class Pager {
	
	/**
	 * hibernate分页显示
	 */
	private int totalRows;            //总行数
	private int pageSize = 11;        //每页显示行数
	private int currentPage ;         //当前页面
	private int totalPages;            //总页数
	private int startRow;             //当前页在数据库中的起始行
	private Map parameterMap;         //传递多个参数
	
	public Pager(){
	}
	
	public Pager(int _totalRows){
		totalRows = _totalRows;
		if(_totalRows==0){
			totalPages = 1;
		}else{
			if(totalRows%pageSize>0){
				totalPages=(totalRows/pageSize)+1;
			}else{
				totalPages=totalRows/pageSize;
			}
		}
		//int mod=totalRows%pageSize;
		//if(mod>0){
		//totalPages++;
		//}
		currentPage = 1;
		startRow = 0;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	
	/**
	 * 首页
	 */
	public void first(){
		startRow = 0;
		currentPage = 1;
	}
	/**
	 * 前一页
	 *
	 */
	public void previous(){
		if(currentPage ==1){
			return;
		}
		currentPage --;
		startRow = (currentPage - 1) * pageSize;
	}
	/**
	 * 下一页
	 */
	public void next(){
		if (currentPage < totalPages) {
			currentPage++;
		}
		startRow = (currentPage - 1) * pageSize;
	}
	/**
	 * 末页
	 */
	public void last(){
		currentPage = totalPages;
		startRow = (currentPage-1) * pageSize;		
	}
	
	/**
	 * 页面输入参数跳转页面
	 */
	public void refresh(int _currentPage){
		currentPage = _currentPage;
		if(currentPage>totalPages){
			last();
		}
	}

	public Map getParameterMap() {
		return parameterMap;
	}

	public void setParameterMap(Map parameterMap) {
		this.parameterMap = parameterMap;
	}
}
