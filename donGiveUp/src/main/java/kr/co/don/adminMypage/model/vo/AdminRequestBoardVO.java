package kr.co.don.adminMypage.model.vo;

import lombok.Data;

@Data
public class AdminRequestBoardVO {
	private int boardNo;
	private int boardKey;
	private String groupName;
	private String boardTitle;
	private String boardWriter;
	private String startDate;
	private int boardState;
	private String memberPhone;
	private String memberEmail;
}
