package kr.co.don.support.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.don.member.model.vo.Member;
import kr.co.don.support.model.service.SupportService;
import kr.co.don.support.model.vo.Support;
import kr.co.don.support.model.vo.SupportApply;
import kr.co.don.support.model.vo.SupportData;



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
	
	@RequestMapping(value= "/supportAd.don")
	public String supportAd() {
		
		return "support/supportAd";
	}
	
	@RequestMapping(value= "/supportWrite.don")
	public String supportWrite() {
		
		return "support/supportWrite";
	}
	
	@RequestMapping(value="/supportList.don")
	public String supportList(int count,Model model,HttpSession session) {
<<<<<<< HEAD
		Member mm = (Member) session.getAttribute("member");
		System.out.println(mm.getMemberType());
		
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
		String supportApplyId;
		
		try{			
			
			Member m = (Member) session.getAttribute("member"); 
			supportApplyId = m.getMemberId();
			System.out.println(supportApplyId);
			
		}catch(Exception e){
<<<<<<< HEAD
					
=======
			
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
			supportApplyId = "";
			
		}
		ArrayList<Support> list = supportService.supportList(count,supportApplyId);
		
<<<<<<< HEAD
		String button;
		//System.out.println(list.size());
		if( list.size() == 16) {
			button ="<button id=\"moreList\" value="+(count+1)+">더 보기</button>";
		}else {
			button = "";
			
		}
		//System.out.println(button);
		/* list foreach문 
		  for(Support i : list) { i.setEnrollEndDate("테스트"); }
		  System.out.println(list.get(0));
		 */
	
		model.addAttribute("List",list);
		model.addAttribute("button", button);
		

=======
		String button ="<button id=\"moreList\" value="+(count+1)+">더 보기</button>";
		
		model.addAttribute("List",list);
		model.addAttribute("button", button);
		
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
		return "support/supportList";
		
	}
	

	@ResponseBody
	//produces = "application/json;의 의미는 json타입으로 보낸다 선언
	@RequestMapping(value= "/moreList.don",produces = "application/json; charset=utf-8")
	public String moreList(int count,Support support, HttpSession session) {
		String supportApplyId;
		
		try{			
			
			Member m = (Member) session.getAttribute("member"); 
			supportApplyId = m.getMemberId();
			System.out.println(supportApplyId);
			
		}catch(Exception e){
			
			supportApplyId = "";
			
		}
		SupportData data = new SupportData();
		
<<<<<<< HEAD
		data.setSupportList(supportService.supportList(count,supportApplyId));
		//support가 끝번호까지 나온경우 더보기 버튼 생성 안하기
		
		if( data.getSupportList().size() == 16) {
			data.setButton("<button id=\"moreList\" value="+(count+1)+">더 보기</button>");	
		}else {
			data.setButton("");
		
		}
=======
		data.setSupportList(supportService.supportList(count,supportApplyId));	
		data.setButton("<button id=\"moreList\" value="+(count+1)+">더 보기</button>");
		
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
		return new Gson().toJson(data);
		
	}
	@RequestMapping(value="/supportApplyWrite.don")
	public String supportApplyWrite(int supportNo,Model model,Support support) {
		
		support = supportService.selectOne(supportNo);
		System.out.println(support);
		
		model.addAttribute("support", support);
		
		return "support/supportApplyWrite";
	}
	
	@RequestMapping(value="/supportInsert.don")
	public String supportInsert(HttpServletRequest request, MultipartFile file, Support support) {
		System.out.println(support);
<<<<<<< HEAD
		
		
		
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
		if (!file.isEmpty()) {
			//저장할 기본 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/support/");

			// 업로드한 파일의 실제 파일명
			String originalFilename = file.getOriginalFilename();
			
			System.out.println(originalFilename);
			//파일 이름만 때서 분리
			String onlyFilename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
			// 확장자
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
			//파일이름 + 확장자
<<<<<<< HEAD
			String filepath = onlyFilename + "_" + getCurrentTime() + extension;
=======
			String filepath = onlyFilename + "_" + System.currentTimeMillis() + extension;
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
			
			String fullpath = savePath + filepath;

			try {

				support.setSupportFilename(originalFilename);
				support.setSupportFilepath(filepath);
				byte[] bytes = file.getBytes();
				System.out.println(support);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();

				System.out.println("파일업로드 완료");

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		int result = supportService.supportInsert(support);

		if (result > 0) {
<<<<<<< HEAD
			return "redirect:/";
		} else {
			return "redirect:/";
=======
			return "/";
		} else {
			return "/";
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
		}
	}
	

	   public long getCurrentTime() {
		      Calendar today = Calendar.getInstance();
		      
		      return today.getTimeInMillis();
	   }
	
	@RequestMapping(value="/supportApplyInsert.don")
	public String supportApplyInsert(SupportApply supportApply) {
		
		int check = supportService.applyInsert(supportApply);
		
		if( check !=0) {
			return "";
		}else {
			return "";
			
		}
	}
}
	

