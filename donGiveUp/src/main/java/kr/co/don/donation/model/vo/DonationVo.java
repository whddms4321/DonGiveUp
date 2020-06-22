package kr.co.don.donation.model.vo;

import lombok.Data;

@Data
public class DonationVo {
	private int donationNo;
	private String donationTitle;
	private String donationContent;
	private String donationType;
	private String donationFilename;
	private String donationFilepath;
	private int donationGoalMoney;
	private int donationStartMoney;
	private String donationEndDate;
	private String donationStartDate;
	private String donationWriter;
	private int donationState;
	private String donationNegative;
	
}
