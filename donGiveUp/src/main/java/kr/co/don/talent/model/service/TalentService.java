package kr.co.don.talent.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import kr.co.don.talent.model.dao.TalentDao;
import kr.co.don.talent.model.vo.Talent;
import kr.co.don.talent.model.vo.TalentBoard;
import kr.co.don.talent.model.vo.TalentBoardData;
import kr.co.don.talent.model.vo.TalentData;
import kr.co.don.talent.model.vo.TalentJoin;
import kr.co.don.talent.model.vo.TalentList;

@Service("talentService")
public class TalentService {
	@Autowired
	@Qualifier("talentDao")
	private TalentDao dao;

	public int insertTalent(Talent t) {
		return dao.insertTalent(t);
	}

	public TalentData talentList(int reqPage, String type) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);

		int totalCount = dao.totalCount(map);
		int numPerPage = 3;
		int totalPage;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		List<Talent> list = dao.talentList(map);

		int pageNaviSize = 3;
		int pageNo;
		if (reqPage % pageNaviSize == 0) {
			pageNo = ((reqPage / pageNaviSize) - 1) * pageNaviSize + 1;
		} else {
			pageNo = (reqPage / pageNaviSize) * pageNaviSize + 1;
		}

		StringBuffer pageNavi = new StringBuffer("");

		if (pageNo != 1) {
			pageNavi.append("<a class='talentPrevBtn' href='/talent/talentFrm.don?reqPage=" + (pageNo - 1) + "&type="
					+ type + "'>이전</a>");
		}

		for (int i = 0; i < pageNaviSize; i++) {

			if (pageNo == reqPage) {
				pageNavi.append("<span class='selectTalentPage'>" + pageNo + "</span>");
			} else {
				pageNavi.append(
						"<a class='talentBtn' href='/talent/talentFrm.don?reqPage=" + pageNo + "&type=" + type + "'>" + pageNo + "</a>");
			}

			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi.append("<a class='talentNextBtn' href='/talent/talentFrm?reqPage=" + pageNo + "&type=" + type
					+ "'>다음</a>");
		}
		return new TalentData((ArrayList<Talent>) list, pageNavi.toString(), totalCount);
	}

	public Talent talentDetail(int talentNo) {
		return dao.talentDetail(talentNo);
	}

	public int insertTalentList(TalentList t) {
		TalentList talent = dao.selectTalentList(t);
		if (talent != null) {
			return 0;
		} else {
			return dao.insertTalentList(t);
		}
	}

	public int updateTalent(Talent t) {
		return dao.updateTalent(t);
	}

	public Talent selectTalentOne(int talentNo) {
		return dao.selectTalentOne(talentNo);
	}

	public int deleteTalent(int talentNo) {
		return dao.deleteTalent(talentNo);
	}

	public ArrayList<TalentJoin> talentListMyList(String memberId) {
		return dao.talentListMyList(memberId);
	}

	public TalentBoardData selectTalentBoard(int talentNo, int reqPage) {
		// 페이지 당 출력 수
		int numPerPage = 3;
		// 총 게시물 수
		int totalCount = dao.totalCount(talentNo);
//		System.out.println(totalCount);
		int totalPage = 0;
		// 총 페이지 수를 연산
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		// 해당 페이지의 게시물들 조회
		ArrayList<TalentBoard> list = dao.selectTalentBoard(start, end,talentNo);

		// 페이지 내비게이션 작성 시작
		String pageNavi = "";
		// 페이지 내비게이션 길이
		int pageNaviSize = 3;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (pageNo != 1) {
			pageNavi += "<a class='noticePrevBtn' href='/talentBoard.don?reqPage=" + (pageNo - pageNaviSize)
					+ "'>이전</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectNoticePage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='noticeBtn' href='/talentBoard.don?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<a class='noticeNextBtn' href='/talentBoard.don?reqPage=" + pageNo + "'>다음</a>";
		}
		TalentBoardData data = new TalentBoardData(list, pageNavi);

		return data;
	}

	public int deleteTalentList(TalentList list) {
		return dao.deleteTalentList(list);
	}

	public ArrayList<Talent> selectTalentList(String memberId) {
		return dao.selectTalentList(memberId);
	}
}
