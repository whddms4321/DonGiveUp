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
		
		System.out.println("글 총 갯수 : " + totalCount);
		
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
		System.out.println("타입"+type);
		System.out.println("제목"+title);
		System.out.println("구분"+requestList);
		System.out.println("정렬"+sorting);
		ArrayList<AdminRequestBoardVO> list = (ArrayList<AdminRequestBoardVO>)dao.selectboardRequestList(map);
		
		System.out.println("리스트 사이즈 : " + list.size());
		
		for (int i=0; i<list.size(); i++) {
			System.out.println("리스트 " + i + " : " + list.get(i).getGroupName() + "  " + list.get(i).getBoardTitle() + "  " + list.get(i).getStartDate());
		}
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		
		// 이전버튼 생선
		if (pageNo != 1) {
			pageNavi += "<a href='javascript:void(0);' onclick='pageMove(this," + (pageNo - 1);
			pageNavi += ");'>이전</a>";
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

		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='javascript:void(0);' onclick='pageMove(this," + pageNo;
			pageNavi += ");'>다음</a>";
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
		
		System.out.println("ETC 글 총 갯수 : " + totalCount);
		
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
		
		System.out.println("ETC 리스트 사이즈 : " + list.size());
		
		for (int i=0; i<list.size(); i++) {
			System.out.println("etc 리스트 " + i + " : " + list.get(i).getGroupName() + "  " + list.get(i).getBoardTitle() + "  " + list.get(i).getStartDate());
		}
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((etcReqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (etcReqPage != 1) {
			pageNo = etcReqPage - 1;
		}
		
		// 이전버튼 생선
		if (pageNo != 1) {
			//페이지 번호에 해당 게시글의 타입과, 요청 페이지를 매개변수로 가지는 savaValue() 호출 -> 다시 선택값을 저장하여 ajax 호출
			pageNavi += "<a href='javascript:void(0);' onclick='saveValue(`" + etcType + "`," + (pageNo - 1) + ");'>이전</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (etcReqPage == pageNo) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				//페이지 번호에 해당 게시글의 타입과, 요청 페이지를 매개변수로 가지는 savaValue() 호출 -> 다시 선택값을 저장하여 ajax 호출
				pageNavi += "<a href='javascript:void(0);' onclick='saveValue(`" + etcType + "`," +  pageNo + ");'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// 다음버튼
		if (pageNo <= totalPage) {
			//페이지 번호에 해당 게시글의 타입과, 요청 페이지를 매개변수로 가지는 savaValue() 호출 -> 다시 선택값을 저장하여 ajax 호출
			pageNavi += "<a href='javascript:void(0);' onclick='saveValue(`"  + etcType + "`," + pageNo + ");'>다음</a>";
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
		
		System.out.println("마감 글 총 갯수 : " + totalCount);
		
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
		
		System.out.println("마감 리스트 사이즈 : " + list.size());
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		
		// 이전버튼 생선
		if (pageNo != 1) {
			pageNavi += "<a href='/deadLineSupportList.don?reqPage=" + (pageNo - 1) + "'>이전</a>";
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

		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/deadLineSupportList.don?reqPage=" + pageNo + "''>다음</a>";
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
		
		System.out.println("마감신청기관 글 총 갯수 : " + totalCount);
		
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
		
		System.out.println("마감신청기관 리스트 사이즈 : " + list.size());
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		
		// 이전버튼 생선
		if (pageNo != 1) {
			pageNavi += "<a href='javascript:void(0);' onclick='companyList(" + supportNo + "," + (pageNo - 1) + ")'>이전</a>";
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

		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='javascript:void(0);' onclick='companyList(" + supportNo + "," + pageNo + ")'>다음</a>";
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
		
		System.out.println("등록 신청기관 글 총 갯수 : " + totalCount);
		
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
		
		System.out.println("등록 신청기관 리스트 사이즈 : " + list.size());
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		
		// 이전버튼 생선
		if (pageNo != 1) {
			pageNavi += "<a href='/companyEnrollReq.don?reqPage=" + (pageNo - 1) + "'>이전</a>";
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

		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/companyEnrollReq.don?reqPage=" + pageNo + "'>다음</a>";
		}
		
		AdminPageDataGenericVO<AdminMemberVO> pageData = new AdminPageDataGenericVO<AdminMemberVO>(list, pageNavi);
		
		return pageData;
		
	}
	
	//후원단체 신청 목록 - 승인 및 거부
	public int enrollCompany(String memberId, int type) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("memberId", memberId);
		map.put("type", String.valueOf(type));
		return dao.enrollCompany(map);
	}
}