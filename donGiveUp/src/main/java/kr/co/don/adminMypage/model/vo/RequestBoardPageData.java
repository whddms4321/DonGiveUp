package kr.co.don.adminMypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RequestBoardPageData {
	private ArrayList<RequestBoardVO> list;
	private String pageNavi;
	
	public RequestBoardPageData() {};
	
	public RequestBoardPageData(ArrayList<RequestBoardVO> list, String pageNavi) {
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
