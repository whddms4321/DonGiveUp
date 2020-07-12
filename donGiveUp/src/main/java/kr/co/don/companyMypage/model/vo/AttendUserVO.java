package kr.co.don.companyMypage.model.vo;

import lombok.Data;

@Data
public class AttendUserVO {
	private String attendId;
	private String attendDate;
	private String attendMoney;
	private String rewardName; //리워드명
	private int rewardCount; //리워드 참여 수량
	private int rewardOnePrice; //리워드 개당 금액
	private int attendUserCount; //함께해요 참여 인원
	private int fundingInPrice; //펀딩 참여 금액
}
