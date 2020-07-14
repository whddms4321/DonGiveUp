package kr.co.don.funding.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FundingView {
	
	private Funding funding;
	private ArrayList<FundingIn> list;
}
