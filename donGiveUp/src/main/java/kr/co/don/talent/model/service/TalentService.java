package kr.co.don.talent.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import kr.co.don.talent.model.dao.TalentDao;
import kr.co.don.talent.model.vo.Talent;
import kr.co.don.talent.model.vo.TalentData;

@Service("talentService")
public class TalentService {
	@Autowired
	@Qualifier("talentDao")
	private TalentDao dao;

	public int insertTalent(Talent t) {
		return dao.insertTalent(t);
	}

	public TalentData talentList(int reqPage, String type) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		
		int totalCount = dao.totalCount(map);
		
		int numPerPage = 5;
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
		List<Talent> list = dao.talentList(map);
		
		
		int pageNaviSize = 11;
		int pageNo; 
		if (reqPage % pageNaviSize == 0) {
			pageNo = ((reqPage / pageNaviSize) - 1) * pageNaviSize + 1;
		} else {
			pageNo = (reqPage / pageNaviSize) * pageNaviSize + 1;
		}
		
		StringBuffer pageNavi = new StringBuffer("");
		
		if (pageNo != 1) {
			pageNavi.append("<a href='/talent/talentFrm.don?reqPage=" + (pageNo - 1) + "&type=" + type +"'><</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			
			if (pageNo == reqPage) {
				pageNavi.append("<span>" + pageNo + "</span>");
			} else {
				pageNavi.append("<a href='/talent/talentFrm.don?reqPage=" + pageNo + "&type=" + type + "'>" + pageNo + "</a>");
			}
			
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a href='/talent/talentFrm?reqPage=" + pageNo + "&type=" + type + "'>></a>");
		}
				
		return new TalentData((ArrayList<Talent>)list, pageNavi.toString(),totalCount);
	}
}
