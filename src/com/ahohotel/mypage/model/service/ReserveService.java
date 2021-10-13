package com.ahohotel.mypage.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.model.dao.ReserveDAO;
import com.ahohotel.mypage.model.dto.ReserveSearchPointDTO;
public class ReserveService {

	private final ReserveDAO reserveDAO;
	
	public ReserveService() {
		reserveDAO = new ReserveDAO();
	}

	public List<ReserveSearchPointDTO> searchPoint(ReserveSearchPointDTO reserveUser) {
		SqlSession session = getSqlSession();
		
		List<ReserveSearchPointDTO> reserveList = reserveDAO.searchPoint(session,reserveUser);
		System.out.println(reserveList);
		session.close();

		return reserveList;
	}

}
