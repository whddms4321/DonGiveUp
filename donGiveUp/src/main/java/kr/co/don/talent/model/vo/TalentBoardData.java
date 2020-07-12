package kr.co.don.talent.model.vo;

import java.util.ArrayList;

public class TalentBoardData {

	private ArrayList<TalentBoard> list;
	private String pageNavi;
	public TalentBoardData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TalentBoardData(ArrayList<TalentBoard> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<TalentBoard> getList() {
		return list;
	}
	public void setList(ArrayList<TalentBoard> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
