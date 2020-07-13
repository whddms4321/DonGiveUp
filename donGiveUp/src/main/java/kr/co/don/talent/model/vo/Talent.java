package kr.co.don.talent.model.vo;

import lombok.Data;

@Data
public class Talent {
	private int talentNo;
	private String talentTitle;
	private String talentWriter;
	private String talentContent;
	private int talentCount;
	private String talentPart;
	private String talentFilename;
	private String talentFilepath;
	private String talentEnrollDate;
}
