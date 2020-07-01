package kr.co.don.dnreview.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.dnreview.model.dao.DnreviewDaoImpl;

@Service("dnreviewService")
public class DnreviewServiceImpl implements DnreviewService {
	@Autowired
	@Qualifier("dnreviewDao")
	private DnreviewDaoImpl dao;
}
