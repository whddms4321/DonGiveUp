package kr.co.don.adminMypage.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import kr.co.don.adminMypage.model.service.AdminMypageService;
import kr.co.don.adminMypage.model.vo.AdminDeadLineSupportVO;
import kr.co.don.adminMypage.model.vo.AdminMemberVO;
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
	
	//마감 후원물품 - 재등록
	@ResponseBody
	@RequestMapping(value="/supportReUpload.don")
	public int supportReUpload(int supportNo) {
		return service.supportReUpload(supportNo);
	}
	
	//
	@ResponseBody
	@RequestMapping(value="/selectApplyId.don")
	public String selectApplyId(String applyId) {
		return service.selectApplyId(applyId);
	}
	
	//마감 후원물품 - 물품을 기관에 배정하기
	@ResponseBody
	@RequestMapping(value="/supportAssignToCompany.don")
	public void supportAssignToCompany(int supportNo, String applyId) {
		HashMap<String,String> map = service.supportAssignToCompany(supportNo, applyId); 
		
	}
	//후원단체 등록 신청목록
	@RequestMapping(value="/companyEnrollReq.don")
	public String companyEnrollReq(int reqPage, Model m) {
		AdminPageDataGenericVO<AdminMemberVO> pageData = service.companyEnrollReq(reqPage);
		m.addAttribute("list", pageData.getList());
		m.addAttribute("pageNavi", pageData.getPageNavi());
		m.addAttribute("reqPage", reqPage);
		return "/mypage/admin/companyEnrollReq";
		 
	}
	
	//후원단체 등록 신청 - 승인 및 거부
	@ResponseBody
	@RequestMapping(value="/enrollCompany.don")
	public int enrollCompany(String memberId, int type, String companyName) {
		return service.enrollCompany(memberId, type, companyName);
	}
	
	//후원단체 조회 - 공공 API
	@ResponseBody
	@RequestMapping(value="/searchCompany.don")
	public HashMap<String, String> searchCompany(String companyNumber){
		String xml = "";
		
        try {
        	StringBuilder urlBuilder = new StringBuilder("http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrGrpInfo"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mpYLA%2Fsl4NYY4NOlQDAOx%2FF4WuuFn5TGF4%2B05DPAt7PUq8d5Vtt4R0PtBgyjUAehqZTDN8Qj2ENhWU1q3CywTw%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("progrmRegistNo","UTF-8") + "=" + URLEncoder.encode(companyNumber, "UTF-8")); /*프로그램등록번호*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { //정상처리가 되었을 때
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			//자원반환!
			rd.close();
			conn.disconnect();
			xml = sb.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        HashMap<String, String> map = new HashMap<String, String>();
        
        //xml 문자열 파싱하기!
        	try {
        		if(xml != null) {
        			//xml을 파싱? 해주는 객체임
        			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
        			
        			//xml의 내용을 바이트 단위로 읽어와서 배열을 만들고 InputStream에 넣는다..?
        			InputStream is = new ByteArrayInputStream(xml.getBytes());
        			//파싱 시작!!
        			Document doc = documentBuilder.parse(is);
        			//최상위 엘리먼트를 가져온당
        			Element rootElement = doc.getDocumentElement();
        			
        			//사업장 주소 가져오기!
        			NodeList items1 =  rootElement.getElementsByTagName("adres"); //루트엘리먼트 밑에 있는 태그들 중 태그이름으로 가져옴!! -TagName은 다수일경우가 있어서 List로 받는다
        			Node item1 = items1.item(0); //태그들 중 첫번째 - 하나밖에 없으니까
        			if(item1 != null) {
        				Node text1 = item1.getFirstChild(); //첫번째 자식?
        				if(text1 != null) {
        					map.put("addr", text1.getNodeValue()); //태그 사이에 있는 값 map에 저장하기        					
        				}
        			}else {
        				System.out.println("null - 주소");
        			}
        			
        			//대표자명 가져오기!
        			NodeList items2 =  rootElement.getElementsByTagName("rprsntvNm");
        			Node item2 = items2.item(0); 
        			if(item2 != null) {
        				Node text2 = item2.getFirstChild();
        				if(text2 != null) {
        					map.put("name", text2.getNodeValue());        					
        				}
        			}else {
        				System.out.println("null - 대표자명");
        			}
        			
        			//후원단체 설립일 가져오기!
        			NodeList items3 =  rootElement.getElementsByTagName("fondDe");
        			Node item3 = items3.item(0); 
        			if(item3 != null) {
        				Node text3 = item3.getFirstChild();
        				if(text3 != null) {
        					map.put("date", text3.getNodeValue());        					
        				}
        			}else {
        				System.out.println("null - 설립일");
        			}
        			
        			//단체 전화번호 가져오기!
        			NodeList items4 =  rootElement.getElementsByTagName("dmstcTelno");
        			Node item4 = items4.item(0); 
        			if(item4 != null) {
        				Node text4 = item4.getFirstChild();
        				if(text4 != null) {
        					map.put("phone", text4.getNodeValue());        					
        				}
        			}else {
        				System.out.println("null - 저나번호");
        			}
        			
        			//후원단체명 가져오기!
        			NodeList items6 =  rootElement.getElementsByTagName("nanmmbyNm");
        			Node item6 = items6.item(0); 
        			if(item6 != null) {
        				Node text6 = item6.getFirstChild();
        				if(text6 != null) {
        					map.put("companyName", text6.getNodeValue());        					
        				}
        			}else {
        				System.out.println("null - 후원단체명");
        			}
        			
        			//후원단체 홈페이지 주소 가져오기!
        			NodeList items7 =  rootElement.getElementsByTagName("hmpgAdres");
        			Node item7 = items7.item(0); 
        			if(item7 != null) {
        				Node text7 = item7.getFirstChild();
        				if(text7 != null) {
        					map.put("companyHomePage", text7.getNodeValue());        					
        				}
        			}else {
        				System.out.println("null - 홈페이지주소");
        			}
        		}
			} catch (Exception e) { //모든 예외처리 가능하도록 처리
				e.printStackTrace();
			}
        
       
		return map;
	}
	
	//회원 or 후원단체 리스트
	@RequestMapping(value="/memberManagementList.don")
	public String memberManagementList(int reqPage, String type,  Model m) {
		AdminPageDataGenericVO<AdminMemberVO> pageData = service.memberManagementList(reqPage, type);
		m.addAttribute("list", pageData.getList());
		m.addAttribute("pageNavi", pageData.getPageNavi());
		m.addAttribute("reqPage", reqPage);
		if(type.equals("nomal")) {
			return "mypage/admin/memberManagement";			
		}else if(type.equals("company")){
			return "mypage/admin/companyManagement";
		}else {
			return null;
		}
	}
	
	//회원 or 후원단체 정지 및 복구
	@ResponseBody
	@RequestMapping(value="/memberStopAndRestore.don")
	public void memberStopAndRestore(String type, String kind, String memberId, Model m) {
		int result = service.memberStopAndRestore(type, kind, memberId);
		m.addAttribute("result", result);
		m.addAttribute("kind", kind);
	}
	
	//정기결제 해지요청 리스트
	@RequestMapping(value="/regularCancelReq.don")
	public String regularCancelReq(int reqPage, String type) {
		service.regularCancelReq(reqPage,type);
		return null;
	}
}

