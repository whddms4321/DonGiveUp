package kr.co.don.donation.model.vo;

import lombok.Data;

@Data
public class Donation {
	private int donationNo;
	private String donationTitle;
	private String donationContent;
	private String donationType;
	private String donationFilename;
	private String donationFilepath;
	private String donationFilepathAdd;
	private int donationGoalMoney;
	private int donationNowMoney;
	private String donationEndDate;
	private String donationStartDate;  
	private String donationWriter;
	private int donationState;
	private String donationNegative;
}
