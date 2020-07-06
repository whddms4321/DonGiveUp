package kr.co.don.support.controller;

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

import kr.co.don.support.model.service.SupportService;
import kr.co.don.support.model.vo.Support;
import kr.co.don.support.model.vo.SupportData;
import net.sf.json.JSON;



@Controller
public class SupportController {
	
	@Autowired
	@Qualifier("supportService")
	private SupportService supportService;
	
	@RequestMapping(value = "/supportFrm.don")
	public String supportFrm() {
		System.out.println("테스트");
		return "support/supportMain";
	}
	
	@RequestMapping(value= "/supportApplyAd.don")
	public String supportApplyAd() {
		
		return "support/supportApplyAd";
	}
	
	@RequestMapping(value= "/supportApplyWrite.don")
	public String supportApplyWrite() {
		
		return "support/supportApplyWrite";
	}
	
	@RequestMapping(value="/supportList.don")
	public String supportList(int count,Support support,Model model,HttpSession session) {
//		String supportApplyId = session.getAttribute("memberId");
		
		String supportApplyId = "admin";
		int rnumMin = ((count-1)*16)+1;
		int rnumMax = count*16; 
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("supportApplyId", supportApplyId);
		map.put("rnumMin", String.valueOf(rnumMin));
		map.put("rnumMax", String.valueOf(rnumMax));
		
		SupportData data = supportService.supportList(map);
		
		String button ="<button id=\"moreList\" value="+(count+1)+">더 보기</button>";
		
		model.addAttribute("supportList",data.getSupportList());
		model.addAttribute("applyList",data.getApplyList());
		model.addAttribute("supportApplyId", supportApplyId);
		model.addAttribute("button", button);
		
		
		return "support/supportList";
		
	}
	
	@ResponseBody
	//produces = "application/json;의 의미는 json타입으로 보낸다 선언
	@RequestMapping(value= "/moreList.don",produces = "application/json; charset=utf-8")
	public String moreList(int count,Support support, HttpSession session) {
	 // String supportApplyId = session.getAttribute("memberId");
		System.out.println(count);
		String supportApplyId = "admin";
		
		int rnumMin = ((count-1)*16)+1;
		int rnumMax = count*16;
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("supportApplyId", supportApplyId);
		map.put("rnumMin", String.valueOf(rnumMin));
		map.put("rnumMax", String.valueOf(rnumMax));
		
		SupportData data = supportService.supportList(map);
		
		String button ="<button id=\"moreList\" value="+(count+1)+">더 보기</button>";
		
		return new Gson().toJson(data);
		
	}
	
	
}
