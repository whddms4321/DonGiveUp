package kr.co.don.adminMypage.model.vo;

import lombok.Data;

@Data
public class AdminMemberVO {
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

