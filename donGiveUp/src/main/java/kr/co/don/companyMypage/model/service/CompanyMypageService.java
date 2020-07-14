package kr.co.don.companyMypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;

import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.companyMypage.model.dao.CompanyMypageDao;
import kr.co.don.companyMypage.model.vo.AttendUserVO;
import kr.co.don.companyMypage.model.vo.CompanyRegularUserVO;
import kr.co.don.companyMypage.model.vo.CompanyReqBoardVO;
import kr.co.don.userMypage.model.vo.UserAttendListVO;

@Service("companyMypageService")
public class CompanyMypageService {
	
	@Autowired
	@Qualifier("companyMypageDao")
	private CompanyMypageDao dao;

	public AdminPageDataGenericVO<CompanyReqBoardVO> selectCompanyReqList(String memberId, int reqPage, String type) {
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("type", type);
		
		int totalCount =   dao.selectCompanyReqListTotalCount(map);
		
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
		
		ArrayList<CompanyReqBoardVO> list = (ArrayList<CompanyReqBoardVO>)dao.selectCompanyReqList(map);
		
		
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
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='reqBoard(`" + type + "`," + (pageNo - 1) + ",`"+memberId+"`);'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a  class='pageNavi' href='javascript:void(0);' onclick='reqBoard(`" + type + "`," +  pageNo + ",`"+memberId+"`);'>" + pageNo+"</a>";	
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='reqBoard(`" + type + "`," + pageNo  + ",`"+memberId+"`);'>></a>";
		}
		
		AdminPageDataGenericVO<CompanyReqBoardVO> pageData = new AdminPageDataGenericVO<CompanyReqBoardVO>(list, pageNavi);
		
		return pageData;
		
	}

	public AdminPageDataGenericVO<CompanyReqBoardVO> selectCompanyBoardList(String type, int reqPage, String memberId) {
		int numPerPage = 10; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("type", type);
		
		int totalCount =   dao.selectCompanyBoardListTotalCount(map);
		
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
		
		ArrayList<CompanyReqBoardVO> list = (ArrayList<CompanyReqBoardVO>)dao.selectCompanyBoardList(map);
		
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
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='boardList(`" + type + "`," + (pageNo - 1) + ",`"+memberId+"`);'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a  class='pageNavi' href='javascript:void(0);' onclick='boardList(`" + type + "`," +  pageNo + ",`"+memberId+"`);'>" + pageNo+"</a>";	
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='boardList(`" + type + "`," + pageNo  + ",`"+memberId+"`);'>></a>";
		}
		
		AdminPageDataGenericVO<CompanyReqBoardVO> pageData = new AdminPageDataGenericVO<CompanyReqBoardVO>(list, pageNavi);
		
		return pageData;
		
		
	}

	public AdminPageDataGenericVO<AttendUserVO> boardAttendUserList(String type, int boardNo, int reqPage) {
		int numPerPage = 5; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardNo", String.valueOf(boardNo));
		map.put("type", type);
		
		int totalCount =   dao.boardAttendUserListTotalCount(map);
		
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
		
		ArrayList<AttendUserVO> list = (ArrayList<AttendUserVO>)dao.boardAttendUserList(map);
		
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
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='boardAttendUserList(`" + type + "`," + boardNo + "," +  (pageNo - 1) + ",this,`page`);'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a  class='pageNavi' href='javascript:void(0);' onclick='boardAttendUserList(`" + type + "`," + boardNo + "," +  pageNo + ",this,`page`);'>" + pageNo+"</a>";	
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='boardAttendUserList(`" + type + "`," + boardNo + "," + pageNo  + ",this,`page`);'>></a>";
		}
		
		AdminPageDataGenericVO<AttendUserVO> pageData = new AdminPageDataGenericVO<AttendUserVO>(list, pageNavi);
		
		return pageData;
	}

	public HashMap<String, Integer> selectNowAndMonthMoney(String memberId) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();  
		int nowMoney = dao.selectNowMoney(memberId);
		int monthMoney = dao.selectMonthMoney(memberId);
		map.put("nowMoney", nowMoney);
		map.put("monthMoney", monthMoney);
		return map;
		
	}

	public AdminPageDataGenericVO<CompanyRegularUserVO> selectCompanyRegularBoard(int reqPage, String memberId, String type) {
		int numPerPage = 5; //한번에 표시할 게시물 수
		
		//검색 조건을 위한 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("type", type);
		
		int totalCount =   dao.selectCompanyRegularBoardTotalCount(map);
		
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
		
		ArrayList<CompanyRegularUserVO> list = (ArrayList<CompanyRegularUserVO>)dao.selectCompanyRegularBoard(map);
		
		
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
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='selectList(`" + type + "`,"  +  (pageNo - 1) + ",`" + memberId + "`);'><</a>";
		}

		// DB 게시물 50개 입력 후 COMMIT
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='pageNavi'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a  class='pageNavi' href='javascript:void(0);' onclick='selectList(`" + type + "`,"  +  pageNo + ",`" + memberId +"`);'>" + pageNo+"</a>";	
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		// >버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='selectList(`" + type + "`," + pageNo  + ",`" + memberId + "`);'>></a>";
		}
		
		AdminPageDataGenericVO<CompanyRegularUserVO> pageData = new AdminPageDataGenericVO<CompanyRegularUserVO>(list, pageNavi);
		
		return pageData;
	}
}
