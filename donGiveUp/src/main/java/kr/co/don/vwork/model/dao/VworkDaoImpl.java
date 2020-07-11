package kr.co.don.vwork.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.vwork.model.vo.VworkVo;

@Repository("vworkDao")
public class VworkDaoImpl implements VworkDao{
	@Autowired
	private SqlSessionTemplate sqlsession;
	public int insertvwork(VworkVo vw) {
		// TODO Auto-generated method stub
		return sqlsession.insert("vwork.insertVwork",vw);
	}

}
