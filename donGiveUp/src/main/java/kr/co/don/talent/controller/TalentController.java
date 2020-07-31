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
import kr.co.don.talent.model.vo.TalentBoard;
import kr.co.don.talent.model.vo.TalentBoardData;
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
		model.addAttribute("type",type);
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
		int count = service.countTalentList(talentNo);
		model.addAttribute("talent",t);
		model.addAttribute("count",count);
		return "talent/talentDetail";
	}
	
	@RequestMapping(value = "/insertTalentList.don")
	public String insertTalentList(int talentNo, String memberId, Model model,int talentCount) {
		if(memberId.equals("")) {
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("loc","/member/loginFrm.don");
			return "main/msg";
		}
		int count = service.countTalentList(talentNo);
		if(count>=talentCount) {
			model.addAttribute("msg","참여인원이 마감되었습니다.");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
		TalentList t = new TalentList();
		t.setMemberId(memberId);
		t.setTalentNo(talentNo);
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
		if(memberId.equals("")) {
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("loc","/member/loginFrm.don");
			return "main/msg";
		}
		ArrayList<TalentJoin> join = service.talentListMyList(memberId);
		if(!join.isEmpty()) {
			model.addAttribute("join",join);
			return "talent/talentListMyList";
		}else {
			model.addAttribute("msg","참여한 목록이 존재하지 않습니다.");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "/talentBoard.don")
	public String talentBoard(int talentNo,int reqPage,Model model,String talentWriter) {
		TalentBoardData data = service.selectTalentBoard(talentNo,reqPage,talentWriter);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("talentNo",talentNo);
		model.addAttribute("talentWriter",talentWriter);
		return "talent/talentBoard";
	}
	
	@RequestMapping(value = "/talentBoardDeleteFrm.don")
	public String talentBoardDeleteFrm(int talentNo,int reqPage,Model model,String talentWriter) {
		TalentBoardData data = service.selectTalentBoard(talentNo,reqPage,talentWriter);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("talentNo",talentNo);
		return "talent/talentBoardDeleteFrm";
	}
	
	@RequestMapping(value = "/deleteTalentList.don")
	public String deleteTalentList(TalentList list,Model model) {
		int result = service.deleteTalentList(list);
		if(result!=0) {
			model.addAttribute("msg","탈퇴 성공");
			model.addAttribute("loc","/");
			return "main/msg";
		}else {
			model.addAttribute("msg","개설자는 탈퇴할 수 없습니다.");
			model.addAttribute("loc","/");
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "/talentListOpen.don")
	public String talentListOpen(String memberId,Model model) {
		if(memberId.equals("")) {
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("loc","/member/loginFrm.don");
			return "main/msg";
		}
		ArrayList<Talent> list = service.selectTalentList(memberId);
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
			return "talent/talentListOpen";
		}else {
			model.addAttribute("msg","개설한 목록이 존재하지 않습니다.");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "/talentBoardDetail.don")
	public String talentBoardDetail(int talentBoardNo,Model model) {
		TalentBoard board = service.talentBoardDetail(talentBoardNo);
		if(board!=null) {
			model.addAttribute("board",board);
			model.addAttribute("talentNo",board.getTalentNo());
			return "talent/talentBoardDetail";
		}else {
			model.addAttribute("msg","목록이 존재하지 않습니다.");
			model.addAttribute("loc","/talent/talentFrm.don?reqPage=1&type=전체");
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "insertTalentBoardFrm.don")
	public String insertTalentBoardFrm(int talentNo,Model model) {
		System.out.println(talentNo);
		model.addAttribute("talentNo",talentNo);
		return "talent/insertTalentBoardFrm";
	}
	
	@RequestMapping(value = "/insertTalentBoard.don")
	public String insertTalentBoard(TalentBoard board,Model model) {
		int result = service.insertTalentBoard(board);
		int talentNo = board.getTalentNo();
		if(result>0) {
			model.addAttribute("msg","게시글 등록 성공");
			model.addAttribute("loc","/talent/talentBoard.don?reqPage=1&talentNo="+talentNo);
			return "main/msg";
		}else {
			model.addAttribute("msg","게시글 등록 실패");
			model.addAttribute("loc","/talent/talentBoard.don?reqPage=1&talentNo="+talentNo);
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "/modifyTalentBoardFrm.don")
	public String modifyTalentBoardFrm(int talentBoardNo,Model model) {
		TalentBoard board = service.selectTalentBoard(talentBoardNo);
		model.addAttribute("board",board);
		return "talent/modifyTalentBoardFrm";
	}
	
	@RequestMapping(value = "/modifyTalentBoard.don")
	public String modifyTalentBoard(Model model,TalentBoard board) {
		int result = service.modifyTalentBoard(board);
		if(result>0) {
			model.addAttribute("msg","게시글 수정 성공");
			model.addAttribute("loc","/talent/modifyTalentBoardFrm.don?talentBoardNo="+board.getTalentBoardNo());
			return "main/msg";
		}else {
			model.addAttribute("msg","게시글 수정 실패");
			model.addAttribute("loc","/talent/modifyTalentBoardFrm.don?talentBoardNo="+board.getTalentBoardNo());
			return "main/msg";
		}
	}
	
	@RequestMapping(value = "/deleteTalentBoard.don")
	public String deleteTalentBoard(int talentBoardNo,int talentNo,Model model) {
		int result = service.deleteTalentBoard(talentBoardNo);
		if(result>0) {
			model.addAttribute("msg","게시글 삭제 성공");
			model.addAttribute("loc","/talent/talentBoard.don?reqPage=1&talentNo="+talentNo);
			return "main/msg";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			model.addAttribute("loc","/talent/talentBoard.don?reqPage=1&talentNo="+talentNo);
			return "main/msg";
		}
	}
}