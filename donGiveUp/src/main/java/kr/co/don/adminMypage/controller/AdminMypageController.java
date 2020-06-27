package kr.co.don.adminMypage.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import kr.co.don.adminMypage.model.service.AdminMypageService;
import kr.co.don.adminMypage.model.vo.AdminDeadLineSupportVO;
import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.adminMypage.model.vo.AdminRequestBoardVO;
import kr.co.don.adminMypage.model.vo.AdminSupportApplyVO;

@Controller
public class AdminMypageController {
	
	@Autowired
	@Qualifier("adminMypageService")
	private AdminMypageService service;
	
	//관리자 마이페이지 메인(DashBoard) 이동 
	@RequestMapping(value="/dashboard.don")
	public String dashboard() {
		
		return "/mypage/admin/dashboard";
	}
	
	//글 등록 신청목록 이동, 첫 로드 시, submit 시  '전체' 탭의 데이터를 구해옴
	@RequestMapping(value="/boardRequestList.don")
	public String boardRequestList(int reqPage, String type, String title, String requestList, String sorting, Model m) {
		
		AdminPageDataGenericVO<AdminRequestBoardVO> pageData = service.selectboardRequestList(reqPage, type, title, requestList, sorting);
		
		//이전 선택값을 페이지에 적용시켜주기 위함.
		m.addAttribute("reqBoardList", pageData.getList());
		m.addAttribute("pageNavi", pageData.getPageNavi());
		m.addAttribute("type", type);
		m.addAttribute("title", title);
		m.addAttribute("requestList", requestList);
		m.addAttribute("sorting", sorting);
		
		return "/mypage/admin/boardRequestList";
	}
	
	//글 등록 신청목록의 '전체'탭에서 페이지 번호를 클릭할 경우 Ajax를 통한 결과값 도출
	@ResponseBody
	@RequestMapping(value = "/boardRequestListAjax.don", produces = "application/json;charset=utf-8;")
	public String boardRequestListAjax(int reqPage, String type, String title, String requestList, String sorting) {
		if(requestList == null) {
			requestList = "null";
		}
		
		AdminPageDataGenericVO<AdminRequestBoardVO> pageData = service.selectboardRequestList(reqPage, type, title, requestList, sorting);
		return new Gson().toJson(pageData);
	}
	
	
	//글 등록 신청목록의 '전체'탭을 제외한 나머지 '기부','펀딩','함께해요','물품후원'
	@ResponseBody
	@RequestMapping(value="/boardRequestListEtc.don", method = RequestMethod.POST, produces = "application/json; charset=utf-8;")
	public String boardRequestListEtc(@RequestBody HashMap<String,Object> obj) {
		System.out.println("java con 요청 페이지 : " + obj.get("etcReqPage"));
		System.out.println("java con 요청 타입 : " + obj.get("etcType"));
		System.out.println("java con 요청 제목 : " + obj.get("etcTitle"));
		System.out.println("java con 요청 구분 : " + obj.get("etcRequestList"));
		System.out.println("java con 요청 정렬 : " + obj.get("etcSorting"));
		
		int etcReqPage = (int) Math.floor((double) obj.get("etcReqPage"));
		String etcType = (String) obj.get("etcType");
		String etcTitle = (String) obj.get("etcTitle");
		String etcRequestList = (String) obj.get("etcRequestList");
		String etcSorting = (String) obj.get("etcSorting");
		
		AdminPageDataGenericVO<AdminRequestBoardVO> pageData = service.selectboardRequestListEtc(etcReqPage, etcType, etcTitle, etcRequestList, etcSorting);
		
		return new Gson().toJson(pageData);
	}
	
	//글 신청 목록 승인
	@ResponseBody
	@RequestMapping(value="/agreeRequestBoard.don")
	public int agreeRequestBoard(String key, String type) {
		System.out.println("state 업데이트 할  key : " + key);
		System.out.println("state 업데이트 할  type : " + type);
		int result = service.agreeRequestBoard(key, type);
		return result;
	}
	
	//글 신청 목록 거부사유 작성
	@ResponseBody
	@RequestMapping(value="/negativeRequestBoard.don")
	public int negativeRequestBoard(String boardKey, String type, String content) {
		System.out.println("거부할 키 : " + boardKey);
		System.out.println("거부할 타입~ : " + type);
		int result = service.negativeRequestBoard(boardKey, type, content);
		return result;
	}
	
	//글 신청 목록 거부사유 확인
	@ResponseBody
	@RequestMapping(value="/selectNegativeContent.don", produces="text/html; charset=utf-8;")
	public String selectNegativeContent(String boardKey, String type) {
		System.out.println("작성했던 거부 사유 키 : " + boardKey);
		System.out.println("작성했던 거부 사유 타입 : " + type);
		String result = service.selectNegativeContent(boardKey, type);
		return result;
	}
	
	//마감 후원물품 - 리스트 구해오기
	@RequestMapping(value="/deadLineSupportList.don")
	public String deadLineSupportList(int reqPage, Model m) {
		AdminPageDataGenericVO<AdminDeadLineSupportVO> pageData = service.deadLineSupportList(reqPage);
		m.addAttribute("list",pageData.getList());
		m.addAttribute("pageNavi", pageData.getPageNavi());
		m.addAttribute("reqPage", reqPage);
		return "/mypage/admin/deadLineSupport";
	}
	
	//마감 후원물품 - 삭제
	@ResponseBody
	@RequestMapping(value="/deleteSupport.don")
	public int deleteSupport(int supportNo) {
		return service.deleteSupport(supportNo);
	}
	
	//마감 후원물품 - 신청 기관 리스트 구해오기
	@ResponseBody
	@RequestMapping(value="/selectSupportRequestCompany.don", produces="application/json; charset=utf-8;")
	public String selectSupportRequestCompany(int supportNo, int reqPage) {
		AdminPageDataGenericVO<AdminSupportApplyVO> pageData = service.selectSupportRequestCompany(supportNo, reqPage);
		return new Gson().toJson(pageData);
	}
	
	//후원단체 등록 신청목록
	//@RequestMapping(value="/companyRequestList.don")
	//public String companyRequestList(int reqPage) {
	//	service.companyRequestList()
	//}
}
