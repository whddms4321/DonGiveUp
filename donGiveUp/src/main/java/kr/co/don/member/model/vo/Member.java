package kr.co.don.member.model.vo;

import lombok.Data;

@Data
public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberAddr;
	private String memberEmail;
	private String memberReferee;
	private int memberType;
	private String memberEnrollDate;
	private int memberMoney;
	private String companyFilename;
	private String companyFilepath;
	private String chartFilename;
	private String chartFilepath;
	private String companyNumber;
	private String companyContent;
	private String companyName;
	
}
