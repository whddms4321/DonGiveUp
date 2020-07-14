package kr.co.don.funding.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.don.funding.model.service.FundingService;
import kr.co.don.funding.model.vo.Funding;
import kr.co.don.funding.model.vo.FundingData;
import kr.co.don.funding.model.vo.FundingView;
import kr.co.don.funding.model.vo.RewardList;
import kr.co.don.member.model.vo.Member;

@Controller
public class FundingController {
	
	@Autowired
	@Qualifier("fundingService")
	private FundingService fundingService; 
	
	@RequestMapping(value="/test.don")
	public String test() {
		return "funding/tt";
	}
	
	@RequestMapping(value="/fundingMain.don")
	public String fundingMain(Funding funding,int reqPage,Model model,String type) {
		
		/*Member m = (Member) session.getAttribute("member");
		String memberId = m.getMemberId();
		*/
		
		 HashMap<String,String> map = new HashMap<String,String>(); 
		 map.put("reqPage", String.valueOf(reqPage)); 
		 FundingData fd = new FundingData();
		 
		 if( type != null) {
			 
			 map.put("type",type);
			 fd = fundingService.selectList(map);
			 switch(type){
				 	
				 case "0" : 
					 type = "공익 나눔";
					 break;
				 case "1" :
					 type = "대안 상생";
					 break;
				 case "2" : 
					 type = "미디어 나눔";
					 break;
				
			 }
		 
		 }else {
			 fd = fundingService.selectList(map);
			 type = "전체";
		 }
		 
		System.out.println("컨트롤러"+type);
		System.out.println("컨트롤러"+fd.getList());
		
		model.addAttribute("list",fd.getList());
		model.addAttribute("pageNavi",fd.getPageNavi());
		model.addAttribute("totalCount",fd.getTotalCount());
		model.addAttribute("type",type);
		
		return "funding/fundingMain";
		
	}
	
	@ResponseBody
	//produces에 제이슨을 지정할수 있다.
	@RequestMapping(value="/fundingEndList.don", produces="application/json; charset=utf-8")
	public String fundingEndList(Funding funding,int reqPage,String type) {
		/*Member m = (Member) session.getAttribute("member");
		String memberId = m.getMemberId();
		*/

		 HashMap<String,String> map = new HashMap<String,String>(); 
		 map.put("reqPage", String.valueOf(reqPage)); 
		 FundingData fd = new FundingData();
		 
		 if( type != null) {
			 
			 map.put("type",type);
			 fd = fundingService.selectList(map);
			 switch(type){
				 	
				 case "0" : 
					 type = "공익 나눔";
					 break;
				 case "1" :
					 type = "대안 상생";
					 break;
				 case "2" : 
					 type = "미디어 나눔";
					 break;
				
			 }
		 
		 }else {
			 fd = fundingService.selectList(map);
			 type = "전체";
		 }
		 
		
		return new Gson().toJson(fd);
		
	}
	
	@RequestMapping(value="/fundingView.don")
	public String fundingView(Model model, int fundingNo) {
		
		FundingView fv = new FundingView();
		
		fv = fundingService.fundingView(fundingNo);
		
		model.addAttribute("funding", fv.getFunding());
		model.addAttribute("list",fv.getList());
		
		return "funding/fundingView";
		
	}
	
	//펀딩글 적기
	@RequestMapping(value="fundingInsertFrm.don")
	public String fundingInsertFrm(HttpSession session,Model model) {
		
		Member member = (Member) session.getAttribute("member");
		System.out.println(member);
		model.addAttribute("member",member);
		
		return "funding/fundingInsert";
		
	}
	
	
	
	@RequestMapping(value="fundingInsert.don")
	public String fundingInsert(HttpSession session,Funding funding,String[] rewardName,String[] rewardContent,String[] rewardPrice,
			String[] rewardAmount) {
		
		//System.out.println(funding);
		//System.out.println(rewardName);
		
		
		String result = fundingService.insertFunding(funding,session,rewardName,rewardContent,rewardPrice,rewardAmount);
		
		
		
		return "redirect:/";
	}
	
}
