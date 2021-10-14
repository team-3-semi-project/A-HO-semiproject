package com.ahohotel.mypage.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.model.dao.ReserveDAO;
import com.ahohotel.mypage.model.dto.ReserveSearchPointDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;
public class ReserveService {

	private final ReserveDAO reserveDAO;
	
	public ReserveService() {
		reserveDAO = new ReserveDAO();
	}

	public List<ReserveSearchPointDTO> searchPoint(int searchUserNo) {
		
		SqlSession session = getSqlSession();
		
		List<ReserveSearchPointDTO> reserveList = reserveDAO.searchReservePoint(session, searchUserNo);
		session.close();
		
		return reserveList;
	}

	public AhoUserDTO searchMemberPoint(int searchUserNo) {
		
		SqlSession session = getSqlSession();
		
		AhoUserDTO ahoUser = reserveDAO.searchMemberPoint(session, searchUserNo);
		session.close();
		
		return ahoUser;
	}

}
