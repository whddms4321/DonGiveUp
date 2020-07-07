package kr.co.don.talent.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
}