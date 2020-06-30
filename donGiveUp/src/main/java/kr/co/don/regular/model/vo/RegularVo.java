package kr.co.don.regular.model.vo;

import lombok.Data;

@Data
public class RegularVo {
	private int regularNo;
	private String regularId;
	private String regularTitle;
	private String regularContent;
	private int regularType;
	private int regularNowMoney;
	private String regularStartDate;
	private int regularState;
	private String regularNegative;
}
