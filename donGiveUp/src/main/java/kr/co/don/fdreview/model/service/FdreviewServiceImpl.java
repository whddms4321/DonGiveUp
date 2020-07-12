package kr.co.don.fdreview.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.fdreview.model.dao.FdreviewDaoImpl;

@Service("fdreviewService")
public class FdreviewServiceImpl implements FdreviewService {
	@Autowired
	@Qualifier("fdreviewDao")
	private FdreviewDaoImpl dao;
}
