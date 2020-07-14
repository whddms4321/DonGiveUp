package kr.co.don.dnreview.model.vo;


public class DncommentVo {
	private int dncommentNo;
	private String dncommentWriter;
	private String dncommentContent;
	private String dncommentDate;
	private int dncommentRef;
	private int dncommentLike;
	public DncommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DncommentVo(int dncommentNo, String dncommentWriter, String dncommentContent, String dncommentDate,
			int dncommentRef, int dncommentLike) {
		super();
		this.dncommentNo = dncommentNo;
		this.dncommentWriter = dncommentWriter;
		this.dncommentContent = dncommentContent;
		this.dncommentDate = dncommentDate;
		this.dncommentRef = dncommentRef;
		this.dncommentLike = dncommentLike;
	}
	public String getDncommentContentBr(){
	    return dncommentContent.replaceAll("\r\n", "<br>");
	 }
	
	public int getDncommentNo() {
		return dncommentNo;
	}
	public void setDncommentNo(int dncommentNo) {
		this.dncommentNo = dncommentNo;
	}
	public String getDncommentWriter() {
		return dncommentWriter;
	}
	public void setDncommentWriter(String dncommentWriter) {
		this.dncommentWriter = dncommentWriter;
	}
	public String getDncommentContent() {
		return dncommentContent;
	}
	public void setDncommentContent(String dncommentContent) {
		this.dncommentContent = dncommentContent;
	}
	public String getDncommentDate() {
		return dncommentDate;
	}
	public void setDncommentDate(String dncommentDate) {
		this.dncommentDate = dncommentDate;
	}
	public int getDncommentRef() {
		return dncommentRef;
	}
	public void setDncommentRef(int dncommentRef) {
		this.dncommentRef = dncommentRef;
	}
	public int getDncommentLike() {
		return dncommentLike;
	}
	public void setDncommentLike(int dncommentLike) {
		this.dncommentLike = dncommentLike;
	}
	
	
	
}
