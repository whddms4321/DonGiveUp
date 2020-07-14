package kr.co.don.bank.model.vo;

import java.util.ArrayList;




public class BankData {
	private ArrayList<Bank> list;
	private String pageNavi;
	private int totalCount;
	
	public BankData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BankData(ArrayList<Bank> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}

	public ArrayList<Bank> getList() {
		return list;
	}

	public void setList(ArrayList<Bank> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	

	
	
}
