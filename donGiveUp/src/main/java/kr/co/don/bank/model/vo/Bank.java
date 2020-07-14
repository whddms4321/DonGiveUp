package kr.co.don.bank.model.vo;

import lombok.Data;

@Data
public class Bank {
	private int bankNo;
	private String bankTitle;
	private String bankContent;
	private String bankFilename;
	private String bankFilepath;
	private int bankGoalMoney;
	private int bankNowMoney;
	private String bankWriter;
	private String bankDate;
	private String  bankOrganization;
	private int bankType;
	private int dnrPercent;
}
