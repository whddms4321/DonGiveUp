package kr.co.don.dnreview.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.don.dnreview.model.dao.DnreviewDaoImpl;
import kr.co.don.dnreview.model.vo.DnbillVo;
import kr.co.don.dnreview.model.vo.DncommentVo;

import kr.co.don.dnreview.model.vo.DnreviewVo;
import kr.co.don.dnreview.model.vo.DnreviewimgVo;
import kr.co.don.donation.model.vo.Donation;

@Service("dnreviewService")
public class DnreviewServiceImpl implements DnreviewService {
	@Autowired
	@Qualifier("dnreviewDao")
	private DnreviewDaoImpl dao;

	public ArrayList<Donation> mydnlist(String memberId) {
		return (ArrayList<Donation>)dao.mydnlist(memberId);
	}

	public Donation selectmydnsel(int donationNo) {
		
		return dao.selectmydnsel(donationNo);
	}

	public int insertdnreview(DnreviewVo dn) {
		
		return dao.insertdnreview(dn);
		
	}



	public int insertdnreview(DnreviewimgVo dni) {
		
		return dao.insertdnrImg(dni);
	}

	public ArrayList<DnreviewVo> dnreviewList(int count) {
		int rnumMin = ((count-1)*8)+1;
		int rnumMax = count*8; 
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("rnumMin", String.valueOf(rnumMin));
		map.put("rnumMax", String.valueOf(rnumMax));
		return (ArrayList<DnreviewVo>)dao.dnreviewList(map);
	}

	public int insertdnbill(DnbillVo db) {
		// TODO Auto-generated method stub
		return dao.insertdnbill(db);
	}

	public ArrayList<DnreviewVo> dnreviewSList(String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList<DnreviewVo>)dao.dnreviewSList(keyword);
	}



	public ArrayList<DnreviewimgVo> selectAlldnrimg(int dnreviewNo) {
		// TODO Auto-generated method stub
		return (ArrayList<DnreviewimgVo>)dao.selectAlldnrimg(dnreviewNo);
	}

	public ArrayList<DnbillVo> selectAlldnrbill(int dnreviewNo) {
		// TODO Auto-generated method stub
		return (ArrayList<DnbillVo>)dao.selectAlldnrbill(dnreviewNo);
	}

	public DnreviewVo selectOnednr(int dnreviewNo) {
		// TODO Auto-generated method stub
		return dao.selectOneDnr(dnreviewNo);
	}

	public ArrayList<DncommentVo> selectdnComment(int dnreviewNo) {
		// TODO Auto-generated method stub
		return (ArrayList<DncommentVo>)dao.selectdnComment(dnreviewNo);
	}

	public int insertDnCmt(DncommentVo dc) {
		// TODO Auto-generated method stub
		return dao.insertDnCmt(dc);
	}

	public DncommentVo selectOneDnCmt() {
		// TODO Auto-generated method stub
		return dao.selectOneDnCmt();
	}

	public int selectcount(int dnreviewNo) {
		// TODO Auto-generated method stub
		return dao.selectcount(dnreviewNo);
	}

	

	

	
}
