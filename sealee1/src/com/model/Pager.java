package com.model;

import java.util.Map;

public class Pager {
	
	/**
	 * hibernate��ҳ��ʾ
	 */
	private int totalRows;            //������
	private int pageSize = 11;        //ÿҳ��ʾ����
	private int currentPage ;         //��ǰҳ��
	private int totalPages;            //��ҳ��
	private int startRow;             //��ǰҳ�����ݿ��е���ʼ��
	private Map parameterMap;         //���ݶ������
	
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
	 * ��ҳ
	 */
	public void first(){
		startRow = 0;
		currentPage = 1;
	}
	/**
	 * ǰһҳ
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
	 * ��һҳ
	 */
	public void next(){
		if (currentPage < totalPages) {
			currentPage++;
		}
		startRow = (currentPage - 1) * pageSize;
	}
	/**
	 * ĩҳ
	 */
	public void last(){
		currentPage = totalPages;
		startRow = (currentPage-1) * pageSize;		
	}
	
	/**
	 * ҳ�����������תҳ��
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
