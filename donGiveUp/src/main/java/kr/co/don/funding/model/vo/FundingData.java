package kr.co.don.funding.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FundingData {
	
	private ArrayList<Funding> list;
	private StringBuffer pageNavi;
	private int totalCount;
}
