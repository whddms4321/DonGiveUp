package kr.co.don.talent.model.vo;

import lombok.Data;

@Data
public class TalentBoard {
	private int talentBoardNo;
	private String talentBoardTitle;
	private String talentBoardContent;
	private int talentNo;
	private String talentBoardWriter;
}
