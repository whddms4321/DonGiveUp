package kr.co.don.userMypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.adminMypage.model.vo.AdminMemberVO;
import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.member.model.vo.Member;
import kr.co.don.userMypage.model.dao.UserMypageDao;
import kr.co.don.userMypage.model.vo.UserAttendListVO;
import kr.co.don.userMypage.model.vo.UserBankInVO;
import kr.co.don.userMypage.model.vo.UserBankVO;
import kr.co.don.userMypage.model.vo.UserMoneyUseListVO;

@Service("userMypageService")
public class UserMypageService {
	@Autowired
	@Qualifier("userMypageDao")
	private UserMypageDao dao;

	public AdminPageDataGenericVO<UserMoneyUseListVO> moneyUserList(String memberId, int reqPage) {
		int numPerPage = 5; //한번에 표시할 게시물 수
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		
		int totalCount =   dao.moneyUserListTotalCount(memberId);
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("memberId", memberId);
		
		int totalPage = 0; //총 페이지 수
		
		if(totalCount%numPerPage==0) {
			totalPage =  totalCount/numPerPage;
		}else {
			totalPage =  totalCount/numPerPage+1;
		}
		
		ArrayList<UserMoneyUseListVO> list = (ArrayList<UserMoneyUseListVO>)dao.moneyUserList(map);
				
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		// <버튼 생선
		if (pageNo != 1) {
				pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='pageMove(" + (pageNo - 1) + ",`"+memberId+"`);'><</a>";
		}
				
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='pageMove(" + (pageNo) + ",`"+memberId+"`);'>" + pageNo+"</a>";	
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='pageMove(" + (pageNo) + ",`"+memberId+"`);'>></a>";
		}
		
		AdminPageDataGenericVO<UserMoneyUseListVO> pageData = new AdminPageDataGenericVO<UserMoneyUseListVO>(list, pageNavi);
		
		return pageData;
		
		
	}

	public int allUseMoney(String memberId) {
		return dao.allUseMoney(memberId);
	}

	public int nowMoney(String memberId) {
		return dao.nowMoney(memberId);
	}

	public HashMap<String, String> dontoriPay(String memberId, int amount) {
		switch(amount) {
			case 5000:
				amount = 55;
				break;
			case 10000:
				amount = 110;
				break;
			case 3000:
				amount = 350;
				break;
			case 50000:
				amount = 600;
				break;
			case 100000:
				amount = 1300;
				break;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("amount", String.valueOf(amount));
		return dao.dontoriPay(map);
	}

	public int userInfoModify(Member m) {
		return dao.userInfoModify(m);
	}

	public HashMap<String, Integer> attenListCount(String memberId) {
		int donationCount =  dao.donationCount(memberId);
		int fundingCount =  dao.fundingCount(memberId);
		int supportCount =  dao.supportCount(memberId);
		int regularCount =  dao.regularCount(memberId);
		int vworkCount =  dao.vworkCount(memberId);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("donationCnt", donationCount);
		map.put("fundingCnt", fundingCount);
		map.put("supportCnt", supportCount);
		map.put("regularCnt", regularCount);
		map.put("vworkCnt", vworkCount);
		return map;
	}

	
	public AdminPageDataGenericVO<UserAttendListVO> attendList(String type, String radio, int reqPage, String  memberId) {
		int numPerPage = 5; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("type", type);
		map.put("radio", radio);
		
		int totalCount =   dao.attendListTotalCount(map);
				
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		int totalPage = 0; //총 페이지 수
		
		if(totalCount%numPerPage==0) {
			totalPage =  totalCount/numPerPage;
		}else {
			totalPage =  totalCount/numPerPage+1;
		}
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		ArrayList<UserAttendListVO> list = (ArrayList<UserAttendListVO>)dao.attendList(map);
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		
		
		// <버튼 생선
		if (pageNo != 1) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='saveValue(`" + type + "`," + radio + "," + (pageNo - 1) + ",`"+memberId+"`);'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a  class='pageNavi' href='javascript:void(0);' onclick='saveValue(`" + type + "`," + radio + "," +  pageNo + ",`"+memberId+"`);'>" + pageNo+"</a>";	
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='saveValue(`" + type + "`," + radio  + "," + pageNo  + ",`"+memberId+"`);'>></a>";
		}
		
		AdminPageDataGenericVO<UserAttendListVO> pageData = new AdminPageDataGenericVO<UserAttendListVO>(list, pageNavi);
		
		return pageData;
	}

	public int regularCancelRequest(int boardNo) {
		return dao.regularCancelRequest(boardNo);
	}

	public String selectNegativeContentUser(int boardNo, String type) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("boardNo", String.valueOf(boardNo));
		return dao.selectNegativeContentUser(map);
	}

	public String selectCompanyReqContent(int boardNo, String type) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("boardNo", String.valueOf(boardNo));
		return dao.selectCompanyReqContent(map);
	}

	public UserBankVO selectBankInfo(String memberId) {
		return dao.selectBankInfo(memberId);
	}

	public AdminPageDataGenericVO<UserBankInVO> selectBankInList(String memberId, int reqPage, int type) {
		int numPerPage = 5; 
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("type", String.valueOf(type));
		
		int totalCount =  dao.selectBankInListTotalCount(map);
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		int totalPage = 0; //총 페이지 수
		
		if(totalCount%numPerPage==0) {
			totalPage =  totalCount/numPerPage;
		}else {
			totalPage =  totalCount/numPerPage+1;
		}
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		ArrayList<UserBankInVO> list = (ArrayList<UserBankInVO>)dao.selectBankInList(map);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		
		
		// <버튼 생선
		if (pageNo != 1) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='bankList(`" + memberId + "`," +  (pageNo - 1) + "," + type + ");'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a  class='pageNavi' href='javascript:void(0);' onclick='bankList(`" + memberId + "`," +  pageNo + "," + type + ");'>" + pageNo+"</a>";	
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='bankList(`" + memberId + "`,"  + pageNo  + "," + type + ");'>></a>";
		}
		
		AdminPageDataGenericVO<UserBankInVO> pageData = new AdminPageDataGenericVO<UserBankInVO>(list, pageNavi);
		
		return pageData;
	}

	public int bankCancelReq(int bankNo) {
		return dao.bankCancelReq(bankNo);
	}

	public HashMap<String, String> donationToCompany(String memberId, String companyName, int price, int bankNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("companyName", companyName);
		map.put("price", String.valueOf(price));
		map.put("bankNo", String.valueOf(bankNo));
		return dao.donationToCompany(map);
	}


}

