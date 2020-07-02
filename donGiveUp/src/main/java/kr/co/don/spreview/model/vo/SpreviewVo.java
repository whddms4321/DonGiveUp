package kr.co.don.spreview.model.vo;

import lombok.Data;

@Data
public class SpreviewVo {
	private int spreviewNo;
	private int spreviewRef;
	private String spreviewTitle;
	private String spreviewWriter;
	private String spreviewContent;
	private String spreviewDate;
	private String spreviewFilename;
	private String spreviewFilepath;
}
