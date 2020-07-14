package kr.co.don.adminMypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class AdminPageDataGenericVO<T> {
	private ArrayList<T> list;
	private String pageNavi;

	
	

	public AdminPageDataGenericVO() {};
	
	public AdminPageDataGenericVO(ArrayList<T> list, String pageNavi) {
		this.list = list;
		this.pageNavi = pageNavi;
	}
}