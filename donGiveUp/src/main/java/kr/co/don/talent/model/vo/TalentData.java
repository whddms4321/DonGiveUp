package kr.co.don.talent.model.vo;

import java.util.ArrayList;


public class TalentData {
	private ArrayList<Talent> list;
	private String pageNavi;
	private int totalCount;
	public TalentData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TalentData(ArrayList<Talent> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}
	public ArrayList<Talent> getList() {
		return list;
	}
	public void setList(ArrayList<Talent> list) {
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
