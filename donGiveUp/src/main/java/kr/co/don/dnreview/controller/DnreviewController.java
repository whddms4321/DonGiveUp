package kr.co.don.dnreview.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.don.dnreview.model.service.DnreviewServiceImpl;
import kr.co.don.dnreview.model.vo.DnbillVo;
import kr.co.don.dnreview.model.vo.DncommentVo;
import kr.co.don.dnreview.model.vo.DnreviewData;
import kr.co.don.dnreview.model.vo.DnreviewVo;
import kr.co.don.dnreview.model.vo.DnreviewimgVo;
import kr.co.don.donation.model.vo.Donation;
import kr.co.don.vwork.model.vo.VworkData;
import kr.co.don.vwork.model.vo.VworkVo;

@Controller
public class DnreviewController {
	@Autowired
	@Qualifier("dnreviewService")
	private DnreviewServiceImpl service;
	
	
	@RequestMapping(value="/dnreviewsearch.don")
	public String dnreviewsearch(String keyword,Model model) {
		ArrayList<DnreviewVo> list = service.dnreviewSList(keyword);
		for( DnreviewVo j : list) {
			int nowMoney = j.getDonationNowMoney();
			System.out.println(nowMoney);
			int goalMoney = j.getDonationGoalMoney();
			System.out.println(goalMoney);
			double result = (double)nowMoney/goalMoney*100;
			System.out.println(result);
			j.setDnrPercent((int)result);
		}
		model.addAttribute("list",list);
		return "review/dnreviewSR";
	}
	
	@RequestMapping(value="/dnreviewlist.don")
	public String dnreviewlist(int count,Model model) {
		
		ArrayList<DnreviewVo> list = service.dnreviewList(count);
	  //System.out.println(list);
		for( DnreviewVo j : list) {
			int nowMoney = j.getDonationNowMoney();
			System.out.println(nowMoney);
			int goalMoney = j.getDonationGoalMoney();
			System.out.println(goalMoney);
			double result = (double)nowMoney/goalMoney*100;
			System.out.println(result);
			j.setDnrPercent((int)result);
		}
		
	
		String button;
	      //System.out.println(list.size());
	      if( list.size() == 8) {
	         button ="<button id=\"moreList\" value="+(count+1)+">더 보기</button>";
	      }else {
	         button = "";
	         
	      }
		
		model.addAttribute("list",list);
		model.addAttribute("button", button);
		
		return "review/dnreviewlist";
	}
	
	@ResponseBody
	@RequestMapping(value="/insertDnCmt.don",produces = "application/json; charset=utf-8;")
	public String insertDnCmt(int dncommentRef,String memberId, String dncommentContent) {
		DncommentVo dc = new DncommentVo();
		dc.setDncommentWriter(memberId);
		dc.setDncommentRef(dncommentRef);
		dc.setDncommentContent(dncommentContent);
		int result = service.insertDnCmt(dc);
	
		return new Gson().toJson(result);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/morednrList.don",produces = "application/json; charset=utf-8;")
	public String morednrList(int count,Model model) {
		ArrayList<DnreviewVo> list = service.dnreviewList(count);
		  //System.out.println(list);
			for( DnreviewVo j : list) {
				int nowMoney = j.getDonationNowMoney();
				System.out.println(nowMoney);
				int goalMoney = j.getDonationGoalMoney();
				System.out.println(goalMoney);
				double result = (double)nowMoney/goalMoney*100;
				System.out.println(result);
				j.setDnrPercent((int)result);
			}
			
		
			String button;
		      //System.out.println(list.size());
		      if( list.size() == 8) {
		         button ="<button id=\"moreList\" value="+(count+1)+">더 보기</button>";
		      }else {
		         button = "";
		         
		      }
		
		DnreviewData data = new DnreviewData();
		data.setDnreviewList(list);
		data.setButton(button);
		
		return new Gson().toJson(data);
	}
	
	@RequestMapping(value="/reviewmain.don")
	public String reviewmain() {
		return "review/reviewmain";
	}

	@RequestMapping(value="/dnrview.don")
	public String dnrview(int dnreviewNo,Model model) {
		DnreviewVo dn = service.selectOnednr(dnreviewNo);
		ArrayList<DncommentVo> drc = service.selectdnComment(dnreviewNo);
		ArrayList<DnreviewimgVo> dri= service.selectAlldnrimg(dnreviewNo);
		ArrayList<DnbillVo> drb = service.selectAlldnrbill(dnreviewNo);
		int count = service.selectcount(dnreviewNo);
		model.addAttribute("dn",dn);
		model.addAttribute("drc",drc);
		model.addAttribute("dri",dri);
		model.addAttribute("drb",drb);
		model.addAttribute("count",count);
		return "review/dnrviewpage";
	}

	
	@RequestMapping(value="dnrwrite.don")
	public String dnrwrite(String memberId,Model model) {
		
		ArrayList<Donation> list = service.mydnlist(memberId);
		
		model.addAttribute("list",list);
		
		return "review/dnrwrite";
	}
	
	@ResponseBody
	@RequestMapping(value="/mydnsel.don",produces = "application/json; charset=utf-8;")
	public String mydnsel(int donationNo) {
		System.out.println("셀렉트~~");
		System.out.println(donationNo);
		Donation dn = service.selectmydnsel(donationNo);
		System.out.println("dn:"+dn);
		return new Gson().toJson(dn);
	}
	/*@RequestMapping(value="/mydnlist.don")
	public String mydnlist(String memberId,Model model) {
		ArrayList<Donation> list = service.mydnlist(memberId);
		model.addAttribute("list",list);
		return "review/mydnlist";
	}*/
	
	@RequestMapping(value="/dnrinsert.don")
	public String dnrinsert(HttpServletRequest request,MultipartFile file,DnreviewVo dn,
								MultipartFile files[],Model model,String dnbillName[], String dnbillDetail[],int dnbillMoney[]) {
		if(!file.isEmpty()){
			try {
				String savaPath = request.getSession().getServletContext().getRealPath("/resources/upload/images/");
				//업로드한 파일의 실제 파일명 -> test.txt
				String originalFilename = file.getOriginalFilename();
				//확장자를 제외한 파일명 -> test
				String onlyFilenme = originalFilename.substring(0,originalFilename.lastIndexOf("."));
				//확장자->.txt
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				String filepath = onlyFilenme+"_"+getCurrentTime()+extension;
				String fullpath = savaPath+filepath;
				byte[] bytes = file.getBytes();
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
				//System.out.println("파일업로드 완료");
				dn.setDnreviewFilename(originalFilename);
				dn.setDnreviewFilepath(filepath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int result = service.insertdnreview(dn);
		if(result>0) {
			
			System.out.println("dnreview는 인서트됨!");
			DnreviewimgVo dni = new DnreviewimgVo();
			for(int i=0; i<files.length; i++) {
				try {
					String savaPath = request.getSession().getServletContext().getRealPath("/resources/upload/images/");
					//업로드한 파일의 실제 파일명 -> test.txt
					String originalFilename = files[i].getOriginalFilename();
					//확장자를 제외한 파일명 -> test
					String onlyFilenme = originalFilename.substring(0,originalFilename.lastIndexOf("."));
					//확장자->.txt
					String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
					String filepath = onlyFilenme+"_"+getCurrentTime()+extension;
					String fullpath = savaPath+filepath;
					byte[] bytes = files[i].getBytes();
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
					bos.write(bytes);
					bos.close();
					//System.out.println("파일업로드 완료");
					dni.setDnreviewimgFilename(originalFilename);
					dni.setDnreviewimgFilepath(filepath);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				result = service.insertdnreview(dni);
				
			}//포문끝
			System.out.println("이거"+dnbillName.length);
			DnbillVo db = new DnbillVo();
			for(int k=0; k<dnbillName.length; k++) {
				db.setDnbillName(dnbillName[k]);
				db.setDnbillDetail(dnbillDetail[k]);
				db.setDnbillMoney(dnbillMoney[k]);
				result = service.insertdnbill(db);
			}
		
			model.addAttribute("msg", "등록완료");
			model.addAttribute("loc","/dnreviewlist.don?count=1");
			return "vwork/msg";
		}else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("loc","/dnreviewlist.don?count=1");
			return "vwork/msg";
		}
		
		
	}
	
		public long getCurrentTime() {
			Calendar today = Calendar.getInstance();
			return today.getTimeInMillis();
		
	}

}
