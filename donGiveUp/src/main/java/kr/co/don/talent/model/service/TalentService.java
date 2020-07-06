package kr.co.don.talent.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.talent.model.dao.TalentDao;

@Service("talentService")
public class TalentService {
	@Autowired
	@Qualifier("talentDao")
	private TalentDao dao;
}
