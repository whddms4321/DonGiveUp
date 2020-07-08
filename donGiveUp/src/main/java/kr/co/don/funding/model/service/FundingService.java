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
	
	public FundingData selectList(int reqPage) {
		
		
		int totalcount = fundingDao.selectone();
		int pageMax = 12; 
		int rnumMin = (reqPage-1)*pageMax;
		int rnumMax = reqPage*pageMax;
		
		String pageNavi = "";
		
		
	
		
		
		
		return null; 
	}

}
