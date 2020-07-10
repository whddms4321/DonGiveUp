package kr.co.don.talent.model.vo;

import java.util.ArrayList;

import kr.co.don.member.model.vo.Member;
import lombok.Data;

@Data
public class TalentJoin {
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
	private int talentNo;
	private String talentTitle;
	private String talentWriter;
	private String talentContent;
	private int talentCount;
	private String talentPart;
	private String talentFilename;
	private String talentFilepath;
	private String talentEnrollDate;	
}
