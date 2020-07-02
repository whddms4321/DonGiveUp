package kr.co.don.donation.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.don.donation.model.dao.DonationDao;
import kr.co.don.donation.model.vo.DonationData;
import kr.co.don.donation.model.vo.Donation;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

@Service("donationService")


public class DonationService {

	@Autowired
	@Qualifier("donationDao")
	private DonationDao donationDao;

	
	public DonationData DonationList(int reqPage, String type) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		
		int totalCount = donationDao.totalCount(map);
		
		int numPerPage = 11;
		int totalPage;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1; 
		}
		
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		List<Donation> list = donationDao.donationList(map);
		
		int pageNaviSize = 5;
		int pageNo; 
		if (reqPage % pageNaviSize == 0) {
			pageNo = ((reqPage / pageNaviSize) - 1) * pageNaviSize + 1;
		} else {
			pageNo = (reqPage / pageNaviSize) * pageNaviSize + 1;
		}
		
		StringBuffer pageNavi = new StringBuffer("");
		
		if (pageNo != 1) {
			pageNavi.append("<a href='donation.don?reqPage=" + (pageNo - 1) + "&type=" + type +"'><</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			
			if (pageNo == reqPage) {
				pageNavi.append("<span>" + pageNo + "</span>");
			} else {
				pageNavi.append("<a href='donation.don?reqPage=" + pageNo + "&type=" + type + "'>" + pageNo + "</a>");
			}
			
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a href='donationList.do?reqPage=" + pageNo + "&type=" + type + "'>></a>");
		}
		
		
				
		return new DonationData((ArrayList<Donation>)list, pageNavi.toString(),totalCount);
	}


	public Donation DonationDetail(int donationNo) {
		return donationDao.DonationDetail(donationNo);
	}

	public int donationInsert(Donation donation) {
		return donationDao.donationInsert(donation);
	}

}
