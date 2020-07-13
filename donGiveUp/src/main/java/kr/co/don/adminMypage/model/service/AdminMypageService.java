
package kr.co.don.adminMypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import kr.co.don.adminMypage.model.dao.AdminMypageDao;
import kr.co.don.adminMypage.model.vo.AdminDeadLineSupportVO;
import kr.co.don.adminMypage.model.vo.AdminMemberVO;
import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.adminMypage.model.vo.AdminRegularInVO;
import kr.co.don.adminMypage.model.vo.AdminRequestBoardVO;
import kr.co.don.adminMypage.model.vo.AdminSupportApplyVO;

@Service("adminMypageService")
public class AdminMypageService {
	@Autowired
	@Qualifier("adminMypageDao")
	private AdminMypageDao dao;

	//글 신청 목록(전체, 기부, 펀딩, 함께해요, 물품후원)
	public AdminPageDataGenericVO<AdminRequestBoardVO> selectboardRequestList(int reqPage, String type, String title, String requestList, String sorting) {
		
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("title", title);
		map.put("req", requestList);
		map.put("sort", sorting);
		
		int totalCount =   dao.selectboardRequestListTotalCount(map);
		
		
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
		ArrayList<AdminRequestBoardVO> list = (ArrayList<AdminRequestBoardVO>)dao.selectboardRequestList(map);
		
				
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
			pageNavi += "<a href='javascript:void(0);' onclick='pageMove(this," + (pageNo - 1);
			pageNavi += ");'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='javascript:void(0);' onclick='pageMove(this," + pageNo;
				pageNavi += ");'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='javascript:void(0);' onclick='pageMove(this," + pageNo;
			pageNavi += ");'>></a>";
		}
		
		AdminPageDataGenericVO<AdminRequestBoardVO> pageData = new AdminPageDataGenericVO<AdminRequestBoardVO>(list, pageNavi);
		
		return pageData;
	}

	//'기부','펀딩','함께해요', '물품후원' 탭 클릭, 페이지번호, 검색버튼, 라디오버튼, 정렬 방식 선택 시
	public AdminPageDataGenericVO<AdminRequestBoardVO> selectboardRequestListEtc(int etcReqPage, String etcType, String etcTitle, String etcRequestList, String etcSorting) {
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", etcType);
		map.put("title", etcTitle);
		if(etcRequestList == null) {
			map.put("req", "");			
		}else {
			map.put("req", etcRequestList);
		}
		map.put("sort", etcSorting);
		
		int totalCount =   dao.selectboardRequestListTotalCountEtc(map);
		
		
		int start = (etcReqPage-1)*numPerPage+1;
		int end = etcReqPage*numPerPage;
		
		int totalPage = 0; //총 페이지 수
		
		if(totalCount%numPerPage==0) {
			totalPage =  totalCount/numPerPage;
		}else {
			totalPage =  totalCount/numPerPage+1;
		}
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		ArrayList<AdminRequestBoardVO> list = (ArrayList<AdminRequestBoardVO>)dao.selectboardRequestListEtc(map);
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((etcReqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (etcReqPage != 1) {
			pageNo = etcReqPage - 1;
		}
		
		// <버튼 생선
		if (pageNo != 1) {
			//페이지 번호에 해당 게시글의 타입과, 요청 페이지를 매개변수로 가지는 savaValue() 호출 -> 다시 선택값을 저장하여 ajax 호출
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='saveValue(`" + etcType + "`," + (pageNo - 1) + ");'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (etcReqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				//페이지 번호에 해당 게시글의 타입과, 요청 페이지를 매개변수로 가지는 savaValue() 호출 -> 다시 선택값을 저장하여 ajax 호출
				pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='saveValue(`" + etcType + "`," +  pageNo + ");'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			//페이지 번호에 해당 게시글의 타입과, 요청 페이지를 매개변수로 가지는 savaValue() 호출 -> 다시 선택값을 저장하여 ajax 호출
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='saveValue(`"  + etcType + "`," + pageNo + ");'>></a>";
		}
		
		AdminPageDataGenericVO<AdminRequestBoardVO> pageData = new AdminPageDataGenericVO<AdminRequestBoardVO>(list, pageNavi);
		
		return pageData;
	}

	//글 신청목록 - 게시글 승인하기
	public int agreeRequestBoard(String key, String type) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("type", type);
		return dao.agreeRequestBoard(map);
		
	}
	
	//글 신청목록 - 거부사유 작성하기
	public int negativeRequestBoard(String boardKey, String type, String content) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", boardKey);
		map.put("type", type);
		map.put("content", content);
		return dao.negativeRequestBoard(map);
	}

	//글 신청목록 - 작성한 거부사유 구해오기
	public String selectNegativeContent(String boardKey, String type) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", boardKey);
		map.put("type", type);
		return dao.selectNegativeContent(map);
	}

	//마감 후원물품 - 리스트 구해오기
	public AdminPageDataGenericVO<AdminDeadLineSupportVO> deadLineSupportList(int reqPage) {
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		int totalCount =   dao.deadLineSupportListTotalCount();
		
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
		
		ArrayList<AdminDeadLineSupportVO> list = (ArrayList<AdminDeadLineSupportVO>)dao.deadLineSupportList(map);
		
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
			pageNavi += "<a href='/deadLineSupportList.don?reqPage=" + (pageNo - 1) + "'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/deadLineSupportList.don?reqPage=" +  pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/deadLineSupportList.don?reqPage=" + pageNo + "''>></a>";
		}
		
		AdminPageDataGenericVO<AdminDeadLineSupportVO> pageData = new AdminPageDataGenericVO<AdminDeadLineSupportVO>(list, pageNavi);
		
		return pageData;
		
	}
	
	//마감 후원물품 - 삭제
	public int deleteSupport(int supportNo) {
		return dao.deleteSupport(supportNo);
	}

	//마감 후원물품 - 신청 기관 리스트 구해오기
	public AdminPageDataGenericVO<AdminSupportApplyVO> selectSupportRequestCompany(int supportNo, int reqPage) {
		
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		int totalCount =   dao.selectSupportRequestCompanyTotalCount(supportNo);
		
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
		map.put("supportNo", String.valueOf(supportNo));
		ArrayList<AdminSupportApplyVO> list = (ArrayList<AdminSupportApplyVO>)dao.selectSupportRequestCompany(map);
		
		
		
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
			pageNavi += "<a href='javascript:void(0);' onclick='companyList(" + supportNo + "," + (pageNo - 1) + ")'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='javascript:void(0);' onclick='companyList(" + supportNo + "," + pageNo + ")'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='javascript:void(0);' onclick='companyList(" + supportNo + "," + pageNo + ")'>></a>";
		}
		
		AdminPageDataGenericVO<AdminSupportApplyVO> pageData = new AdminPageDataGenericVO<AdminSupportApplyVO>(list, pageNavi);
		
		return pageData;
	}
	
	//마감 후원물품 - 재등록
	public int supportReUpload(int supportNo) {
		return dao.supportReUpload(supportNo);
	}

	public HashMap<String,String> supportAssignToCompany(int supportNo, String applyId) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("supportNo", String.valueOf(supportNo));
		map.put("applyId",applyId);
		HashMap<String,String> result = dao.supportAssignToCompany(map);
		return result;
	}

	//후원단체 등록 신청목록
	public AdminPageDataGenericVO<AdminMemberVO> companyEnrollReq(int reqPage) {
		
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		int totalCount =   dao.companyEnrollReqTotalCount();
		
		
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
		
		ArrayList<AdminMemberVO> list = (ArrayList<AdminMemberVO>)dao.companyEnrollReq(map);

		
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
			pageNavi += "<a href='/companyEnrollReq.don?reqPage=" + (pageNo - 1) + "'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/companyEnrollReq.don?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/companyEnrollReq.don?reqPage=" + pageNo + "'>></a>";
		}
		
		AdminPageDataGenericVO<AdminMemberVO> pageData = new AdminPageDataGenericVO<AdminMemberVO>(list, pageNavi);
		
		return pageData;
		
	}
	
	//후원단체 신청 목록 - 승인 및 거부
	public int enrollCompany(String memberId, int type, String companyName) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("memberId", memberId);
		map.put("companyName", companyName);
		map.put("type", String.valueOf(type));
		return dao.enrollCompany(map);
	}

	public String selectApplyId(String applyId) {
		return dao.selectApplyId(applyId);
	}

	//회원 or 후원기관 - 리스트
	public AdminPageDataGenericVO<AdminMemberVO> memberManagementList(int reqPage, String type) {
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		int totalCount =   dao.memberManagementListTotalCount(type);
		
		
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
		map.put("type", type);
		
		ArrayList<AdminMemberVO> list = (ArrayList<AdminMemberVO>)dao.memberManagementList(map);
		
		
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
			pageNavi += "<a href='/memberManagementList.don?reqPage=" + (pageNo - 1) + "&type="+type+"'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/memberManagementList.don?reqPage=" + pageNo + "&type="+type+"'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/memberManagementList.don?reqPage=" + pageNo + "&type="+type+"'>></a>";
		}
		
		AdminPageDataGenericVO<AdminMemberVO> pageData = new AdminPageDataGenericVO<AdminMemberVO>(list, pageNavi);
		
		return pageData;
	}

	public int memberStopAndRestore(String type, String kind, String memberId) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("type", type);
		map.put("kind", kind);
		map.put("memberId", memberId);
		return dao.memberStopAndRestore(map);
	}

	public AdminPageDataGenericVO<AdminRegularInVO> regularCancelReq(int reqPage, String type) {
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		int totalCount =   dao.regularCancelReqTotalCount(map);
		
		
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
		
		ArrayList<AdminRegularInVO> list = (ArrayList<AdminRegularInVO>)dao.regularCancelReq(map);
		
		
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
			pageNavi += "<a href='/regularCancelReq.don?reqPage=" + (pageNo - 1) + "&type="+type+"'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/regularCancelReq.don?reqPage=" + pageNo + "&type="+type+"'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/regularCancelReq.don?reqPage=" + pageNo + "&type="+type+"'>></a>";
		}
		
		AdminPageDataGenericVO<AdminRegularInVO> pageData = new AdminPageDataGenericVO<AdminRegularInVO>(list, pageNavi);
		
		return pageData;
	}

	public int updateRegular(int regularNo, String type) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("regularNo", String.valueOf(regularNo));
		map.put("type", type);
		return dao.updateRegular(map);
	}

	public HashMap<String, Integer> dashboard() {
		int boardList =  dao.allBoardCount();
		int companyCompleteList = dao.allCompanyCompleteCount();
		int companyReqList = dao.allCompanyReqCount();
		int memberList = dao.allMemberCount();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("board", boardList);
		map.put("comMember", companyCompleteList);
		map.put("reqMember", companyReqList);
		map.put("member", memberList);
		return map;
	}

	public HashMap<String, Integer> chartData() {
		int donation = dao.allDonationCount();
		int funding = dao.allFundingCount();
		int support = dao.allSupportCount();
		int vwork = dao.allVworkCount();
		int regular = dao.allRegularCount();
		
		int donationComplete = dao.donationComplete();
		int donationReq = dao.donationReq();
		int donationNegative = dao.donationNegative();
		
		int fundingComplete = dao.fundingComplete();
		int fundingReq = dao.fundingReq();
		int fundingNegative = dao.fundingNegative();
		
		int supportComplete = dao.supportComplete();
		int supportReq = dao.supportReq();
		int supportNegative = dao.supportNegative();
		
		int vworkComplete = dao.vworkComplete();
		int vworkReq = dao.vworkReq();
		int vworkNegative = dao.vworkNegative();
		
		int regularComplete = dao.regularComplete();
		int regularReq = dao.regularReq();
		int regularNegative = dao.regularNegative();

		
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("donation", donation);
		map.put("funding", funding);
		map.put("support", support);
		map.put("vwork", vwork);
		map.put("regular", regular);
		
		map.put("donationCom", donationComplete);
		map.put("donationReq", donationReq);
		map.put("donationNeg", donationNegative);
		
		map.put("fundingCom", fundingComplete);
		map.put("fundingReq", fundingReq);
		map.put("fundingNeg", fundingNegative);
		
		map.put("supportCom", supportComplete);
		map.put("supportReq", supportReq);
		map.put("supportNeg", supportNegative);
		
		map.put("vworkCom", vworkComplete);
		map.put("vworkReq", vworkReq);
		map.put("vworkNeg", vworkNegative);
		
		map.put("regularCom", regularComplete);
		map.put("regularReq", regularReq);
		map.put("regularNeg", regularNegative);
		
		return map;
		
		
		
	}

}