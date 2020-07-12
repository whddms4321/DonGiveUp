package kr.co.don.companyMypage.model.vo;

import lombok.Data;

@Data
public class CompanyReqBoardVO {
	private int boardNo;
	private String boardTitle;
	private int boardState;
	private String negativeContent;
	private String boardStartDate;
	private String boardEndDate;
}
