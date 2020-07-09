package kr.co.don.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.funding.model.dao.FundingDao;
import kr.co.don.funding.model.vo.Funding;
import kr.co.don.funding.model.vo.FundingData;

@Service
public class FundingService {

	@Autowired
	@Qualifier("fundingDao")
	private FundingDao fundingDao;
	
	public FundingData selectList(HashMap<String,String> map) {
				
		//총 게시물 숫자
		int totalCount = fundingDao.selectone(map);
		System.out.println("토탈"+totalCount);
		//보여줄 최대 게시물 숫자
		int numPerPage = 12;
		//총 페이징 숫자
		int totalPage;
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1; 
		}
		//페이징 번호
		int reqPage = Integer.parseInt(map.get("reqPage"));
		System.out.println("페이지번호 "+reqPage);
		//가져올 게시물 번호
		int rnumMin = (reqPage-1)*numPerPage;
		int rnumMax = reqPage*numPerPage;
		
		map.put("rnumMin",String.valueOf(rnumMin));
		map.put("rnumMax",String.valueOf(rnumMax));
		
		System.out.println("맵"+map.get("type"));
		
		FundingData data = new FundingData();
		
		ArrayList<Funding> list = (ArrayList<Funding>)fundingDao.selectList(map);
		
		System.out.println(list);
		data.setList(list);
		data.setTotalCount(totalCount);
		
		//보여줄 페이징 최대값
		int pageNaviSize = 5;
		int pageNo; 
		if (reqPage % pageNaviSize == 0) {
			pageNo = ((reqPage / pageNaviSize) - 1) * pageNaviSize + 1;
		} else {
			pageNo = (reqPage / pageNaviSize) * pageNaviSize + 1;
		}
		
		StringBuffer pageNavi = new StringBuffer("<ul class=\"pagination\">");
		
		if( map.get("type") != "전체") {
			String type = map.get("type");
			
			/* 부트스트랩 페이징 사용
			  <ul class="pagination"> <li class="page-item"><a class="page-link"
			  href="#">Previous</a></li> <li class="page-item"><a class="page-link"
			  href="#">1</a></li> <li class="page-item active"><a class="page-link"
			  href="#">2</a></li> <li class="page-item"><a class="page-link"
			  href="#">3</a></li> <li class="page-item"><a class="page-link"
			  href="#">Next</a></li> </ul>
			 */
			
			if (pageNo != 1) {
				pageNavi.append("<li class='page-item'><a class='page-link' href='fundingMain.don?reqPage=" + (pageNo - 1) 
						+ "&type=" + type + "'>Previous</a></li>");
			}
			
			for (int i = 0; i < pageNaviSize; i++) {
				
				if (pageNo == reqPage) {
					pageNavi.append("<li class=\"page-item\"><a class=\"page-link disabled\"\r\n" + 
							"href=\"#\">"+pageNo+"</a></li>");
				} else {
					pageNavi.append("<li class=\"page-item\"><a class=\"page-link\" href='fundingMain.don?reqPage=" + pageNo + "&type=" + type +"'>" + pageNo + "</a></li>");
				}
				
				pageNo++;
				if (pageNo > totalPage) {
					break;
				}
			}
			
			if (pageNo <= totalPage) {
				pageNavi.append("<li class=\"page-item\"><a href='fundingMain.don?reqPage=" + pageNo + "&type=" + type +"'></a></li>");
			}
			
					
		}else {

			if (pageNo != 1) {
				pageNavi.append("<li class='page-item'><a class='page-link' href='fundingMain.don?reqPage=" + (pageNo - 1) 
						+"'>Previous</a></li>");
			}
			
			for (int i = 0; i < pageNaviSize; i++) {
				
				if (pageNo == reqPage) {
					pageNavi.append("<li class=\"page-item\"><a class=\"page-link disabled\"\r\n" + 
							"href=\"#\">"+pageNo+"</a></li>");
				} else {
					pageNavi.append("<li class=\"page-item\"><a class=\"page-link\" href='fundingMain.don?reqPage=" + pageNo +"'>" + pageNo + "</a></li>");
				}
				
				pageNo++;
				if (pageNo > totalPage) {
					break;
				}
			}
			
			if (pageNo <= totalPage) {
				pageNavi.append("<li class=\"page-item\"><a href='fundingMain.don?reqPage=" + pageNo +"'></a></li>");
			}
	
		}
		data.setPageNavi(pageNavi);
		
	
		return data; 
	}

}
