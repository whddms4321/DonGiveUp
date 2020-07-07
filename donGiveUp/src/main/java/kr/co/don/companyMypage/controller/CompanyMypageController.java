package kr.co.don.companyMypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.companyMypage.model.service.CompanyMypageService;
import kr.co.don.companyMypage.model.vo.CompanyReqBoardVO;

@Controller
public class CompanyMypageController {

	@Autowired
	@Qualifier("companyMypageService")
	private CompanyMypageService service;
	
	
	@RequestMapping(value="/companyMypage.don")
	public String companyMypage(){
		return "mypage/company/companyReqList";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCompanyReqList.don", produces="application/json; charset=utf-8;")
	public String selectCompanyReqList(String memberId, int reqPage, String type) {
		return new Gson().toJson(service.selectCompanyReqList(memberId, reqPage,type));
	}
}
