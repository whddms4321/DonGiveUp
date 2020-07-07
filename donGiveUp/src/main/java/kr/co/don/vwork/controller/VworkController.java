package kr.co.don.vwork.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.don.vwork.model.service.VworkServiceImpl;
import kr.co.don.vwork.model.vo.VworkVo;

@Controller

public class VworkController {
	@Autowired
	@Qualifier("vworkService")
	private VworkServiceImpl service;
	
	@RequestMapping(value="/vworklist.don")
	public String vworklist(int count,VworkVo vw,Model model) {
		
		int rnumMin = ((count-1)*9)+1;
		int rnumMax = count*9;
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("rnumMin", String.valueOf(rnumMin));
		map.put("rnumMax", String.valueOf(rnumMax));
		
		
		
		return "vwork/vworklist";
	}
	
	@RequestMapping(value="/vworkwrite.don")
	public String vworkwrite() {
		return "vwork/vworkwrite";
	}
	
	@RequestMapping(value="/vworkbooking.don")
	public String vworkbooking() {
		return "vwork/vworkbooking";
	}
	@RequestMapping(value="/vworkpayment.don")
	public String vworkpayment() {
		return "vwork/vworkpayment";
	}
	
	@RequestMapping(value="/vworkinsert.don")
	public String vworkinsert(HttpServletRequest request,MultipartFile file, VworkVo vw) {
		
		//System.out.println(vw.getVworkJoinDate());
		
		String str = vw.getVworkJoinDate();
		
		StringTokenizer st = new StringTokenizer(str,",");
		String arr[] = new String[st.countTokens()];
		int i =0;
		while(st.hasMoreElements()) {
			arr[i++] = st.nextToken();
		}
		int j = arr.length-1;
		String lastdate = arr[j];
		
		vw.setVworkDlDate(lastdate);
		
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
				vw.setVworkFilename(originalFilename);
				vw.setVworkFilepath(filepath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int result = service.insertvwork(vw);
		if(result>0) {
			return "vwork/vwUploadSuccess";
		}else {
			return "vwork/vwUploadFail" ;
		}
	}
		
		public long getCurrentTime() {
			Calendar today = Calendar.getInstance();
			return today.getTimeInMillis();
			
		}
}
