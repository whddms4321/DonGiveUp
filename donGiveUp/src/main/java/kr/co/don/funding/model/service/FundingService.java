package kr.co.don.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.funding.model.dao.FundingDao;
import kr.co.don.funding.model.vo.Funding;
import kr.co.don.funding.model.vo.FundingData;
import kr.co.don.funding.model.vo.FundingIn;
import kr.co.don.funding.model.vo.FundingView;
import kr.co.don.funding.model.vo.RewardList;

@Service
public class FundingService {

	@Autowired
	@Qualifier("fundingDao")
	private FundingDao fundingDao;
	
	
	public FundingData selectList(HashMap<String,String> map) {
				
		//총 게시물 숫자
		int totalCount = fundingDao.totalCount(map);
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

	public FundingView fundingView(int fundingNo) {
		
		FundingView fv = new FundingView();
		
		fv.setFunding(fundingDao.fundingView(fundingNo));
		fv.setList((ArrayList<FundingIn>)fundingDao.fundingInList(fundingNo));
		
		return fv;
	}

	public void scheduledList() {
		
		ArrayList<Funding>list = new ArrayList<Funding>();
		list = (ArrayList<Funding>)fundingDao.scheduledList();
		
		for( Funding n : list) {
			if( n.getFundingGoalPrice() <= n.getFundingNowPrice()) {
				int result = fundingDao.updateType(n.getFundingNo());
				if( result>0) {
					ArrayList<FundingIn>listIn = new ArrayList<FundingIn>();
					listIn = (ArrayList<FundingIn>)fundingDao.refundList(n.getFundingNo());
					for( FundingIn m : listIn) {
						m.setFundingInPrice(m.getFundingInPrice()/100);
						int resultM = fundingDao.refund(m);
						
					}
				}
			}
			
		}
	 System.out.println("스케줄 서비스 실행");
	}

	public String insertFunding(Funding funding, HttpSession session, String[] rewardName, String[] rewardContent, String[] rewardPrice, String[] rewardAmount) {
		
		int check = fundingDao.insertFunding(funding);
		
		if( check !=0) {
			ArrayList<RewardList> list = new ArrayList<RewardList>();
			check = fundingDao.research();
			System.out.println(check);
			System.out.println("1차");
			
			for(int i=0; i<rewardName.length;i++) {
				System.out.println("2차");
				
				RewardList rd = new RewardList();
				
				rd.setRewardName(rewardName[i]);
				rd.setRewardContent(rewardContent[i]);
				rd.setRewardPrice(Integer.parseInt(rewardPrice[i]));
				rd.setRewardAmount(Integer.parseInt(rewardAmount[i]));
				rd.setFundingNo(check);
				System.out.println(rd);
				fundingDao.insertReward(rd);
					
				
				
			}
		}
		

		String result ="redirect:/";
		
		return result;
	}

}
