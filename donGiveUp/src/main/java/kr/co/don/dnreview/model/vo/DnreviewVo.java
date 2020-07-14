package kr.co.don.dnreview.model.vo;

import lombok.Data;

@Data
public class DnreviewVo {
	private int dnreviewNo;
	private String dnreviewTitle;
	private int dnreviewRef;
	private String dnreviewWriter;
	private int dnreviewTargetper;
	private String dnreviewContent;
	private String dnreviewDate;
	private String dnreviewFilename;
	private String dnreviewFilepath;
	private String donationStartDate;
	private String donationEndDate;
	private String companyName;
	private int donationGoalMoney;
	private int donationNowMoney;
	private int dnrPercent;
	private String donationType;
}
