package kr.co.don.support.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.support.model.dao.SupportDao;
import kr.co.don.support.model.vo.Support;


@Service
public class SupportService {
	
	@Autowired
	@Qualifier("supportDao")
	private SupportDao supportDao;

	public ArrayList<Support> supportList(HashMap<String,String> map) {
			
		return (ArrayList<Support>)supportDao.supportList(map);
	}
	
	 
	
}
