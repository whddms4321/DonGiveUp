package kr.co.don.vwork.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.vwork.model.dao.VworkDaoImpl;

@Service("vworkService")
public class VworkServiceImpl implements VworkService {
	@Autowired
	@Qualifier("vworkDao")
	private VworkDaoImpl dao;
}
