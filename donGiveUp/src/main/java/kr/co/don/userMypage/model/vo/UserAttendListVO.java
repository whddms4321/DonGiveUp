package kr.co.don.userMypage.model.vo;

import lombok.Data;

@Data
public class UserAttendListVO {
	private int rNum;
	private int boardNo; //참여 글 번호
	private String boardWriter; //참여자
	private String boardTitle; //글제목(정기후원은 대상기관명)
	private int boardRef; //상세보기를 위한 해당 글 번호
	private int boardMoney; //참여금액(기부, 펀딩은 돈토리고 정기후원은 현금)
	private String boardDate; //참여 날짜(정기후원은 첫 결제 날짜, 함께해요는 봉사가는날짜)
	private int boardCount; //참여 수량(펀딩은 리워드 수량, 물품후원은 물품수량)
	private int fundingCashMoney; //참여 금액(펀딩 시 현금)
	private String boardRewardName; //펀딩 리워드명
	private String boardPlace; //함께해요 봉사장소
	private int boardState; //물품후원 상태(0 : 처리대기,  1,2,3 : 처리완료 1은 진행중과 기간종료(심사중) 2는 거부됨, 3은 배정완료
	private int supportKind;
	private String regularEndDate;
	private int rewardOnePrice;
}
