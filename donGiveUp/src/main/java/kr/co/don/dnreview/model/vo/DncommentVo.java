package kr.co.don.dnreview.model.vo;

import lombok.Data;

@Data
public class DncommentVo {
	private int dncommentNo;
	private String dncommentWriter;
	private String dncommentContent;
	private String dncommentDate;
	private String dncommentRef;
	private int dncommentLike;
}
