
package kr.co.don.adminMypage.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import kr.co.don.adminMypage.model.service.AdminMypageService;
import kr.co.don.adminMypage.model.vo.AdminDeadLineSupportVO;
import kr.co.don.adminMypage.model.vo.AdminMemberVO;
import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.adminMypage.model.vo.AdminRegularInVO;
import kr.co.don.adminMypage.model.vo.AdminRequestBoardVO;
import kr.co.don.adminMypage.model.vo.AdminSupportApplyVO;

@Controller
public class AdminMypageController {
	
	@Autowired
	@Qualifier("adminMypageService")
	private AdminMypageService service;
	
	//관리자 마이페이지 메인(DashBoard) 이동 
	@RequestMapping(value="/dashboard.don")
	public String dashboard(Model m ) {
		HashMap<String, Integer> map = service.dashboard();
		m.addAttribute("board", map.get("board"));
		m.addAttribute("reqMem", map.get("reqMember"));
		m.addAttribute("comMem", map.get("comMember"));
		m.addAttribute("mem", map.get("member"));
		m.addAttribute("regular", map.get("regular"));
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
		int result = service.agreeRequestBoard(key, type);
		return result;
	}
	
	//글 신청 목록 거부사유 작성
	@ResponseBody
	@RequestMapping(value="/negativeRequestBoard.don")
	public int negativeRequestBoard(String boardKey, String type, String content) {
		int result = service.negativeRequestBoard(boardKey, type, content);
		return result;
	}
	
	//글 신청 목록 거부사유 확인
	@ResponseBody
	@RequestMapping(value="/selectNegativeContent.don", produces="text/html; charset=utf-8;")
	public String selectNegativeContent(String boardKey, String type) {
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
        
        //return할 Map 생성
		HashMap<String, String> map = new HashMap<String, String>();
        
        	//xml 문자열 파싱하기
        	try {
        		if(xml != null) {
        			//xml을 파싱할 때 사용하는 객체
        			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
        			
        			//String 변수에 담겨있는 xml 정보를 바이트 배열로 생성
        			InputStream is = new ByteArrayInputStream(xml.getBytes());
        			//파싱 DocumentBuilder 인스턴스로 파싱
        			Document doc = documentBuilder.parse(is);
        			//파싱 후 하위 노드에 접근을 위한 루트 Element를 얻는다.
        			Element rootElement = doc.getDocumentElement();
        			//원하는 정보(태그)들의 상위 엘리먼트를 선택
        			NodeList test = rootElement.getElementsByTagName("item");
        			//실제 정보들을 list로 생성
        			NodeList list = test.item(0).getChildNodes();
        			
        			for(int i=0; i<list.getLength(); i++) {
        				if(list.item(i).getFirstChild() != null) { //값이 있을 시에만
        					String nodeName = list.item(i).getNodeName(); //태그명
        					String nodeValue = list.item(i).getFirstChild().getNodeValue(); //태그의 value
        					map.put(nodeName, nodeValue); //맵에 키-값 저장					
        				}
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
	public String regularCancelReq(int reqPage, String type, Model m) {
		AdminPageDataGenericVO<AdminRegularInVO> pageData = service.regularCancelReq(reqPage,type);
		m.addAttribute("list", pageData.getList());
		m.addAttribute("pageNavi", pageData.getPageNavi());
		m.addAttribute("reqPage", reqPage);
		m.addAttribute("type", type);
		return "mypage/admin/regularCancelReq";
	}
	
	//정기결제 해지요청 리스트 Ajax
	@ResponseBody
	@RequestMapping(value="/regularCancelReqAjax.don", produces="application/json; charset=utf-8;")
	public String regularCancelReqAjax(String type) {
		AdminPageDataGenericVO<AdminRegularInVO> pageData = service.regularCancelReq(1,type);
		return new Gson().toJson(pageData);
	}
	
	@ResponseBody
	@RequestMapping(value="/updateRegular.don")
	public int updateRegular(int regularNo, String type) {
		return service.updateRegular(regularNo, type);
	}
	
	@ResponseBody
	@RequestMapping(value="/chartData.don" , produces = "application/json;")
	public String chartData() {
		HashMap<String, Integer> map = service.chartData();
		return new Gson().toJson(map);
	}
	
	@RequestMapping(value="/companyFileDownload.don", produces = "application/octet-stream;")
	public void noticeFileDownload(HttpServletRequest request, HttpServletResponse response, String filename, String filepath) {
		 String root = request.getSession().getServletContext().getRealPath("/resources/song/company/");
	      // 파일이랑 서블릿 연결
	      FileInputStream fis;
	      try {
	         fis = new FileInputStream(root+filepath);
	         // 속도를 위한 보조스트림 생성
	         BufferedInputStream bis = new BufferedInputStream(fis);
	         // 파일을 내보내기 위한 스트림 생성
	         ServletOutputStream sos = response.getOutputStream();
	         // 속도를 위한 보조스트림 생성
	         BufferedOutputStream bos = new BufferedOutputStream(sos);
	         
	         String resFilename = "";
	         // 브라우저가 IE인지 확인
	         boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1 
	               || request.getHeader("user-agent").indexOf("Trident")!= -1;
	         
	         if(bool) {//IE 인 경우
	            resFilename = URLEncoder.encode(filename,"utf-8");
	            resFilename = resFilename.replaceAll("\\\\", "%20");
	         }else {//나머지 브라우저인 경우
	            resFilename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
	         }
	         // 파일 다운로드를 위한 HTTP Header설정
	         response.setContentType("application/octet-stream");
	         // 다운로드 받을 이름
	         response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
	         // Input by BufferedInputStream content and then output by BufferedOutputStream
	         // 읽을 값이 없으면 read가 -1 이 됨
	         int read = -1;
	         while((read=bis.read())!=-1) {
	            bos.write(read);
	         }
	         bos.close();
	         bis.close();
	      } catch (FileNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }


	}
}
