package kr.co.don.userMypage.model.vo;

import lombok.Data;

@Data
public class UserBankInVO {
	private int bankInNo;
	private String bankInId;
	private int bankInMoney;
	private String bankInDate;
	private String bankEndDate;
	private String bankInPayNum;
	private int bankInType;
	private int bankInCancel;
	private int bankNo;
	private String bankTitle;
	private int bankType;
}