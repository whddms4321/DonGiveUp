package kr.co.don.companyMypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.companyMypage.model.dao.CompanyMypageDao;
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
		
		System.out.println(type + "신청 총 갯수 : " + totalCount);
		
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
		
		System.out.println(type + "신청 리스트 사이즈 : " + list.size());
		
		
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
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='reqBoard(`" + type + "`," + (pageNo - 1) + ",`"+memberId+"`);'>이전</a>";
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

		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a class='pageNavi' href='javascript:void(0);' onclick='reqBoard(`" + type + "`," + pageNo  + ",`"+memberId+"`);'>다음</a>";
		}
		
		AdminPageDataGenericVO<CompanyReqBoardVO> pageData = new AdminPageDataGenericVO<CompanyReqBoardVO>(list, pageNavi);
		
		return pageData;
		
	}
}
