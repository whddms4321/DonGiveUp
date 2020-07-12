package kr.co.don.vwork.model.service;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.HashMap;

=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import kr.co.don.vserver.model.vo.VserverVo;
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
import kr.co.don.vwork.model.dao.VworkDaoImpl;
import kr.co.don.vwork.model.vo.VworkVo;

@Service("vworkService")
public class VworkServiceImpl implements VworkService {
	@Autowired
	@Qualifier("vworkDao")
	private VworkDaoImpl dao;

	
<<<<<<< HEAD
	public int insertvwork(VworkVo vw) {
		return dao.insertvwork(vw);
	}



	public ArrayList<VworkVo> vworkList(int count) {
		
		int rnumMin = ((count-1)*6)+1;
		int rnumMax = count*6; 
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("rnumMin", String.valueOf(rnumMin));
		map.put("rnumMax", String.valueOf(rnumMax));
		
		return (ArrayList<VworkVo>)dao.vworkList(map);
	}

	public ArrayList<VworkVo> vwListsearch(String keyword,int count) {
		int rnumMin = ((count-1)*6)+1;
		int rnumMax = count*6;
		
		HashMap<String, String> map  = new HashMap<String, String>();
		
		map.put("rnumMin", String.valueOf(rnumMin));
		map.put("rnumMax", String.valueOf(rnumMax));
		map.put("keyword", keyword);
		return (ArrayList<VworkVo>)dao.vwListsearch(map);
	}
	public ArrayList<VserverVo> selectvwticketCnt(String vserdate, int vworkNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		System.out.println(vserdate);
		System.out.println(vworkNo);
		map.put("vserdate", vserdate);
		map.put("vworkNo", String.valueOf(vworkNo));
		
		return (ArrayList<VserverVo>)dao.selectvwticketCnt(map);
	}

	public VworkVo selectOneVwork(int vworkNo) {
		
		return dao.selectOneVwork(vworkNo);
	}



	public int vserperCnt(int vworkNo) {
		ArrayList<VserverVo> list = (ArrayList<VserverVo>)dao.vserperCnt(vworkNo);
		int count = 0; 
		if(! list.isEmpty()) {
			for(VserverVo j :list) {
			 count += j.getVserverPer();
			}
			return count;
		}else {
			return count;
		}
	}



	public int vworkupdate(VworkVo v) {
		
		return dao.vworkupdate(v);
	}



=======

	



	public int insertvwork(VworkVo vw) {
		
		return dao.insertvwork(vw);
	}
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
}
