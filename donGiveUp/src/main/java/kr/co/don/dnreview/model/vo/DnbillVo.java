package kr.co.don.dnreview.model.vo;

import lombok.Data;

@Data
public class DnbillVo {
	private int dnbillNo;
	private int dnbillRef;
	private String dnbillName;
	private String dnbillDetail;
	private int dnbillMoney;
}
