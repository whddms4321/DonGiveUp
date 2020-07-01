package kr.co.don.support.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class SupportMoreList {
	
	private ArrayList<Support> list;
	private String supportApplyId;
	private String button;
}
