package kr.co.don.regular.model.vo;

import java.util.ArrayList;

import kr.co.don.member.model.vo.Member;
import kr.co.don.regularIn.model.vo.RegularInVo;




public class RegularData {
	private ArrayList<Member> list;
	private ArrayList<RegularInVo> list2;
	public RegularData(ArrayList<Member> list, ArrayList<RegularInVo> list2) {
		super();
		this.list = list;
		this.list2 = list2;
	}
	public ArrayList<Member> getList() {
		return list;
	}
	public void setList(ArrayList<Member> list) {
		this.list = list;
	}
	public ArrayList<RegularInVo> getList2() {
		return list2;
	}
	public void setList2(ArrayList<RegularInVo> list2) {
		this.list2 = list2;
	}
	
}
