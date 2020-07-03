package kr.co.don.vsreview.model.vo;

import lombok.Data;

@Data
public class VsreviewVo {
	private int vsreviewNo;
	private int vsreviewRef;
	private int vsreviewScore;
	private String vsreviewContent;
	private String vsreviewFilename;
	private String vsreviewFilepath;
	private String vsreviewWriter;
}
