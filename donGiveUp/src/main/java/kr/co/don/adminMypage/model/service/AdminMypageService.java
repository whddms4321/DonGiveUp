package kr.co.don.adminMypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import kr.co.don.adminMypage.model.dao.AdminMypageDao;
import kr.co.don.adminMypage.model.vo.RequestBoardPageData;
import kr.co.don.adminMypage.model.vo.RequestBoardVO;

@Service("adminMypageService")
public class AdminMypageService {
	@Autowired
	@Qualifier("adminMypageDao")
	private AdminMypageDao dao;

	//글 신청 목록(전체, 기부, 펀딩, 함께해요, 물품후원)
	public RequestBoardPageData selectboardRequestList(int reqPage, String type, String title, String requestList, String sorting) {
		
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
		ArrayList<RequestBoardVO> list = (ArrayList<RequestBoardVO>)dao.selectboardRequestList(map);
		
		System.out.println("리스트 사이즈 : " + list.size());
		
		for (int i=0; i<list.size(); i++) {
			System.out.println("리스트 " + i + " : " + list.get(i).getGroupName() + "  " + list.get(i).getBoardTitle() + "  " + list.get(i).getStartDate());
		}
		
		String pageNavi = "";
		int pageNaviSize = 5;
		
		// pageNo 연산 -> 페이지 시작번호
		// int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		int pageNo = 1;
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
		
		RequestBoardPageData pageData = new RequestBoardPageData(list, pageNavi);
		
		return pageData;
	}

	//후원단체 등록 신청목록
	public void companyRequestList(int reqPage) {
		
		 
	}
}
