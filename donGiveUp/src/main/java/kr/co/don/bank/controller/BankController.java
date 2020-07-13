package kr.co.don.bank.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.print.attribute.standard.Severity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javafx.scene.control.Alert;
import kr.co.don.bank.model.service.BankService;
import kr.co.don.bank.model.vo.Bank;
import kr.co.don.bank.model.vo.BankData;
import kr.co.don.bankIn.model.vo.BankInVo;
import kr.co.don.donation.model.service.DonationService;
import kr.co.don.donation.model.vo.DonationData;
import kr.co.don.donationIn.model.vo.DonationInVo;
import kr.co.don.member.model.vo.Member;
import kr.co.don.donation.model.vo.Donation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
public class BankController {
	@Autowired
	private BankService service;
	
	
	@RequestMapping(value = "/bank.don")
	public String bank(int reqPage, int type, String keyword,Model model) {
		
		BankData data = service.BankList(reqPage,type ,keyword);
		int totalCount = data.getTotalCount();

		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("totalCount",totalCount);
		
		return "bank/bank";

	}
	@RequestMapping(value = "/bankInsertFrm.don")
	public String banlInsertFrm(Model model) {
		ArrayList<Member> list  = service.SelectOrg();
		
		model.addAttribute("list",list);
		
		return "bank/bankInsert";
	}	
	
	@RequestMapping(value = "/bankInsert.don")
	public String bankInsert(HttpServletRequest request, MultipartFile file, Bank bank, Model model) {
		if (!file.isEmpty()) {

			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/images/");

			// 업로드한 파일의 실제 파일명
			String originalFilename = file.getOriginalFilename();
			System.out.println(originalFilename);

			String onlyFilename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
			// 확장자
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

			String filepath = onlyFilename + "_" + System.currentTimeMillis() + extension;

			String fullpath = savePath + filepath;

			try {  
				bank.setBankFilename(originalFilename);
				bank.setBankFilepath(fullpath);
				byte[] bytes = file.getBytes();
				
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();

				System.out.println("파일업로드 완료");

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		int result = service.BankInsert(bank);
		int reqPage = 1;
		int type = 0;
		String keyword = null;
		
		BankData data = service.BankList(reqPage,type ,keyword);
		int totalCount = data.getTotalCount();

		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("totalCount",totalCount);
		

		if (result > 0) {
			return "bank/bank";
		} else {
			
			return "bank/bankInsert";
		}
	}
	
	@RequestMapping(value = "/bankDetail.don")
	public String donationDetail(int bankNo,Model model) {
		
		Bank detail = service.BankDetail(bankNo);
		int money = detail.getBankGoalMoney() - detail.getBankNowMoney();
		model.addAttribute("detail", detail);
		model.addAttribute("money", money);
		return "bank/bankDetail";	
	}
	
	@RequestMapping(value = "/bankMoney.don")
	public String bankMoney(Bank b,String memberId,Model model) {
		
		Member m = service.MemberSearch(memberId);
		

		model.addAttribute("m",m);
		model.addAttribute("b", b);

		return "bank/bankMoney";	
	}
	
	@RequestMapping(value = "/bankInInsert.don")
	public String bankInInsert(String bankInId, BankInVo b, int bankNowMoney , Bank b1, Model model) {
		
		int result = service.BankInInsert(b);
		Member m = service.MemberSearch(bankInId);
	
		
		
		int memMon= m.getMemberMoney();
		int donInMon = b.getBankInMoney();
		int resultMon = memMon-donInMon;
		
		int resultDon = bankNowMoney+(donInMon*100);
		b1.setBankNowMoney(resultDon);	
		m.setMemberMoney(resultMon);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
		
		Date time = new Date();
				System.out.println("m:"+m.getMemberId());

	
		String time2 = format2.format(time);
		if (result > 0) {
			if(b.getBankInType()==0) {
			int result2 = service.MemberMoneyUpdate(m);
			int result3 = service.BankMoneyUpdate(b1);
			if(result2>0 && result3>0) {
				model.addAttribute("m",m);
				model.addAttribute("b",b);
				model.addAttribute("time",time2);
			return "bank/bankInSuccess";
			}else {
				model.addAttribute("m",m);
				model.addAttribute("b",b);
				model.addAttribute("time",time2);	
				return "bank/bankInSuccess";
			}
		} else {
			return "bank/bankInFail";
			
		}
		
	}else {
		return "donation/donationInFail";
	}
		
	}
	
	

	
	
}