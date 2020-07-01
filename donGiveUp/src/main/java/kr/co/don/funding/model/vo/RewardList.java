package kr.co.don.funding.model.vo;

import lombok.Data;

@Data
public class RewardList {
	
	private int fundingNo;
	private int rewardListNo;
	private String rewardName;
	private String rewardContent;
	private int rewardPrice;
	private int rewardAmount;
	private String rewardSendDate;
	private String rewardImgFilename;
	private String rewardImgFilepath;
	
}
