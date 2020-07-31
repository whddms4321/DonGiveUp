package kr.co.don.bank.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.don.bank.model.dao.BankDao;
import kr.co.don.bank.model.vo.Bank;
import kr.co.don.bank.model.vo.BankData;
import kr.co.don.bankIn.model.vo.BankInVo;
import kr.co.don.donationIn.model.vo.DonationInVo;
import kr.co.don.member.model.vo.Member;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

@Service("bankService")


public class BankService {

	@Autowired
	@Qualifier("bankDao")
	private BankDao bankDao;
	
	

	
	public BankData BankList(int reqPage, int type, String keyword) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", String.valueOf(type));
		map.put("keyword", keyword);
		
		int totalCount = bankDao.totalCount(map);
		
		int numPerPage = 6;
		int totalPage;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1; 
		}
		
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		List<Bank> list = bankDao.BankList(map);
		
	
		
		int pageNaviSize = 5;
		int pageNo; 
		if (reqPage % pageNaviSize == 0) {
			pageNo = ((reqPage / pageNaviSize) - 1) * pageNaviSize + 1;
		} else {
			pageNo = (reqPage / pageNaviSize) * pageNaviSize + 1;
		}
		
		StringBuffer pageNavi = new StringBuffer("");
		
		if (pageNo != 1) {
			pageNavi.append("<a href='bank.don?reqPage=" + (pageNo - 1) + "&type=" + type + "&keyword="+keyword+"'><</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			
			if (pageNo == reqPage) {
				pageNavi.append("<span>" + pageNo + "</span>");
			} else {
				pageNavi.append("<a href='bank.don?reqPage=" + pageNo + "&type=" + type +"&keyword="+keyword+ "'>" + pageNo + "</a>");
			}
			
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a href='bank.don?reqPage=" + pageNo + "&type=" + type + "&keyword="+keyword+"'>></a>");
		}
		
		
				
		return new BankData((ArrayList<Bank>)list, pageNavi.toString(), totalCount);
	}




	public ArrayList<Member> SelectOrg() {
		List<Member> list = bankDao.SelectOrg();
		 
		 return (ArrayList<Member>)list; 
	}




	public int BankInsert(Bank bank) {
		// TODO Auto-generated method stub
		return bankDao.BankInsert(bank);
	}




	public Bank BankDetail(int bankNo) {
		// TODO Auto-generated method stub
		return bankDao.BankDetail(bankNo);
	}




	public Member MemberSearch(String memberId) {
		// TODO Auto-generated method stub
		return bankDao.MemberSearch(memberId);
	}




	public int BankInInsert(BankInVo b) {
		// TODO Auto-generated method stub
		return bankDao.BankInInsert(b);
	}




	public int MemberMoneyUpdate(Member m) {
		// TODO Auto-generated method stub
		return bankDao.MemberMoneyUpdate(m);
	}




	public int BankMoneyUpdate(Bank b1) {
		// TODO Auto-generated method stub
		return bankDao.BankMoneyUpdate(b1);
	}









}
