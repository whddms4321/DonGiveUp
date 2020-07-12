package kr.co.don.support.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.support.model.dao.SupportDao;
import kr.co.don.support.model.vo.Support;
import kr.co.don.support.model.vo.SupportApply;
import kr.co.don.support.model.vo.SupportData;


@Service
public class SupportService {
	
	@Autowired
	@Qualifier("supportDao")
	private SupportDao supportDao;

	public ArrayList<Support> supportList(int count,String supportApplyId) {
		

		int rnumMin = ((count-1)*16)+1;
		int rnumMax = count*16; 
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("supportApplyId", supportApplyId);
		map.put("rnumMin", String.valueOf(rnumMin));
		map.put("rnumMax", String.valueOf(rnumMax));
		
		return (ArrayList<Support>)supportDao.supportList(map);
	}

	public Support selectOne(int supportNo) {
		
		return supportDao.selectOne(supportNo);
	}

	public int applyInsert(SupportApply supportApply) {
		
		return supportDao.applyInsert(supportApply);
	}

	public int supportInsert(Support support) {
		
		return supportDao.supportInsert(support);
	}

	
	
	 
	
}
