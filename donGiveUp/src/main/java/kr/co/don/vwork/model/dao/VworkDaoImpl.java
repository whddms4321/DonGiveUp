package kr.co.don.vwork.model.dao;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import kr.co.don.vserver.model.vo.VserverVo;
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
import kr.co.don.vwork.model.vo.VworkVo;

@Repository("vworkDao")
public class VworkDaoImpl implements VworkDao{
	@Autowired
	private SqlSessionTemplate sqlsession;
	public int insertvwork(VworkVo vw) {
		// TODO Auto-generated method stub
		return sqlsession.insert("vwork.insertVwork",vw);
	}
<<<<<<< HEAD
	public List<VworkVo> vworkList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("vwork.vworkList",map);
	}
	public List<VworkVo> vwListsearch(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("vwork.vwListsearch",map);
	}
	
	public VworkVo selectOneVwork(int vworkNo) {
		
		return sqlsession.selectOne("vwork.selectOneVwork",vworkNo);
	}
	public List<VserverVo> selectvwticketCnt(HashMap<String, String> map) {
		
		return sqlsession.selectList("vserver.selectvwticketCnt",map);
	}
	public List<VserverVo> vserperCnt(int vworkNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("vserver.selectvserperCnt",vworkNo);
	}
	public int vworkupdate(VworkVo v) {
	
		return sqlsession.update("vwork.vworkupdate",v);
	}
	
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"

}
