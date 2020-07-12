package kr.co.don.spreview.model.vo;

import lombok.Data;

@Data
public class SpcommentVo {
	private int spcommentNo;
	private int spcommentRef;
	private String spcommentContent;
	private String spcommentDate;
	private String spcommentWriter;
	private int spcommentLike;
}
