package kr.co.don.donation.model.vo;

import java.util.ArrayList;




public class DonationData {
	private ArrayList<Donation> list;
	private String pageNavi;
	private int totalCount;
	public DonationData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DonationData(ArrayList<Donation> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}
	public ArrayList<Donation> getList() {
		return list;
	}
	public void setList(ArrayList<Donation> list) {
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
