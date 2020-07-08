package kr.co.don.talent.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.don.talent.model.service.TalentService;
import kr.co.don.talent.model.vo.Talent;
import kr.co.don.talent.model.vo.TalentData;
import kr.co.don.talent.model.vo.TalentJoin;
import kr.co.don.talent.model.vo.TalentList;

@Controller
@RequestMapping("/talent")
public class TalentController {
	@Autowired
	@Qualifier("talentService")
	private TalentService service;
	
	@RequestMapping(value = "/talentFrm.don")
	public String talentFrm(int reqPage, String type,Model model) {
		TalentData data = service.talentList(reqPage, type);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("totalCount", data.getTotalCount());
		return "talent/talentFrm";
	}
	
	@RequestMapping(value = "/insertTalentFrm.don")
	public String insertTalentFrm() {
		return "talent/insertTalentFrm";
	}
	
	@RequestMapping(value = "/insertTalent.don")
	public String insertTalent(HttpServletRequest request,Talent t,MultipartFile file,Model model) {
		if(!file.isEmpty()) {
			try {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/song/talent/thumbs/");
				// 업로드한 파일의 실제 파일명
				String originalFilename = file.getOriginalFilename();
				t.setTalentFilename(originalFilename);
				// 확장자를 제외한 파일명 -> test
				String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf("."));
				// 확장자 -> .txt
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				String filepath = onlyFilename+"_"+getCurrentTime()+extension;
				t.setTalentFilepath(filepath);
				String fullpath = savePath+filepath;
				byte[] bytes = file.getBytes();
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int result = service.insertTalent(t);
		if(result!=0) {
			model.addAttribute("msg","게시글 등록 성공");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}else {
			model.addAttribute("msg","게시글 등록 실패");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
	}
	public long getCurrentTime() {
		Calendar today = Calendar.getInstance();
		return today.getTimeInMillis();
	}
	
	@RequestMapping(value = "/talentDetail.don")
	public String talentDetail(int talentNo,Model model){
		Talent t = service.talentDetail(talentNo);
		model.addAttribute("talent",t);
		return "talent/talentDetail";
	}
	
	@RequestMapping(value = "/insertTalentList.don")
	public String insertTalentList(int talentNo, String memberId, Model model) {
		TalentList t = new TalentList();
		t.setMemberId(memberId);
		t.setTalentNo(talentNo);
		if(memberId!=null) {
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("loc","/member/loginFrm.don");
			return "main/msg";
		}
		int result = service.insertTalentList(t);
		if(result!=0) {
			model.addAttribute("msg","재능기부 참여 성공");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}else {
			model.addAttribute("msg","이미 참여한 재능기부입니다.");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "updateTalentFrm.don")
	public String updateTalentFrm(int talentNo,Model model) {
		Talent talent = service.selectTalentOne(talentNo);
		model.addAttribute("talent",talent);
		return "talent/updateTalentFrm";
	}
	
	@RequestMapping(value = "/updateTalent.don")
	public String updateTalent(Talent t,Model model) {
		int result = service.updateTalent(t);
		if(result!=0) {
			model.addAttribute("msg","재능기부 수정 성공");
			model.addAttribute("loc","/talent/talentDetail.don?talentNo="+t.getTalentNo());
			return "main/msg";
		}else {
			model.addAttribute("msg","재능기부 수정 실패");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "/deleteTalent.don")
	public String deleteTalent(int talentNo,Model model) {
		int result = service.deleteTalent(talentNo);
		if(result!=0) {
			model.addAttribute("msg","재능기부 삭제 성공");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}else {
			model.addAttribute("msg","재능기부 삭제 실패");
			model.addAttribute("loc","/talent/talentDetail.don?talentNo="+talentNo);
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "/talentListMyList.don")
	public String talentListMyList(String memberId,Model model) {
		ArrayList<TalentJoin> join = service.talentListMyList(memberId);
		if(join!=null) {
			model.addAttribute("join",join);
			return "talent/talentListMyList";
		}else {
			model.addAttribute("msg","참여한 목록이 존재하지 않습니다.");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
	}
}