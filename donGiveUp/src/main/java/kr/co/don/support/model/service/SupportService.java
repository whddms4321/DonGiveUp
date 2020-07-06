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

	public SupportData supportList(HashMap<String,String> map) {
		
		SupportData data = new SupportData();
		
		data.setSupportList((ArrayList<Support>)supportDao.supportList(map));
		data.setApplyList((ArrayList<SupportApply>)supportDao.applyList(map));
		
		
		return data;
	}
	
	 
	
}
