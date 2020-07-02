package kr.co.don.adminMypage.model.vo;

import lombok.Data;

@Data
public class AdminDeadLineSupportVO {
	private int supportNo;
	private String supportId;
	private String supportName;
	private String memberPhone;
	private String memberEmail;
	private String enrollStartDate;
	private String enrollEndDate;
}
