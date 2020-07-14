package kr.co.don.dnreview.model.dao;


import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.dnreview.model.vo.DnbillVo;
import kr.co.don.dnreview.model.vo.DncommentVo;
import kr.co.don.dnreview.model.vo.DnreviewVo;
import kr.co.don.dnreview.model.vo.DnreviewimgVo;
import kr.co.don.donation.model.vo.Donation;

@Repository("dnreviewDao")
public class DnreviewDaoImpl implements DnreviewDao {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public List<Donation> mydnlist(String memberId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("dnreview.mydnlist",memberId);
	}

	public Donation selectmydnsel(int donationNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("dnreview.selectmydnsel",donationNo);
	}

	public int insertdnreview(DnreviewVo dn) {
		// TODO Auto-generated method stub
		return sqlsession.insert("dnreview.insertdnreview",dn);
	}

	public int insertdnrImg(DnreviewimgVo dni) {
		// TODO Auto-generated method stub
		return sqlsession.insert("dnreview.insertdnrImg",dni);
	}

	public List<DnreviewVo> dnreviewList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("dnreview.selectdnrList",map);
	}

	public int insertdnbill(DnbillVo db) {
		// TODO Auto-generated method stub
		return sqlsession.insert("dnreview.insertdnbill",db);
	}

	public List<DnreviewVo> dnreviewSList(String keyword) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("dnreview.dnreviewSList",keyword);
	}

	public DnreviewVo selectOneDnr(int dnreviewNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("dnreview.selectonednrview",dnreviewNo);
	}

	public List<DncommentVo> selectdnComment(int dnreviewNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("dnreview.selectdnCommentlist",dnreviewNo);
	}

	public List<DnreviewimgVo> selectAlldnrimg(int dnreviewNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("dnreview.selectAlldnrimg",dnreviewNo);
	}

	public List<DnbillVo> selectAlldnrbill(int dnreviewNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("dnreview.selectAlldnrbill",dnreviewNo);
	}

	public int insertDnCmt(DncommentVo dc) {
		// TODO Auto-generated method stub
		return sqlsession.insert("dnreview.insertDnCmt",dc);
	}

	public DncommentVo selectOneDnCmt() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("dnreview.selectOneDnCmt");
	}

	public int selectcount(int dnreviewNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("dnreview.selectcount",dnreviewNo);
	}

	




	

}
