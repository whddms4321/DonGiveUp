package kr.co.don.spreview.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.spreview.model.dao.SpreviewDaoImpl;

@Service("spreviewService")
public class SpreviewServiceImpl implements SpreviewService {
	@Autowired
	@Qualifier("spreviewDao")
	private SpreviewDaoImpl dao;
}
