package kr.co.don.userMypage.model.vo;

import lombok.Data;

@Data
public class UserBankVO {
	private int bankNo;
	private String bankTitle;
	private int bankGoalMoney;
	private int bankNowMoney;
	private String bankWriter;
	private String bankDate;
	private String bankOrganization;
	private int bankType;
}