package com.ahohotel.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.model.dto.ReserveDTO;
import com.ahohotel.mypage.model.dto.ReserveSearchPointDTO;

public class ReserveDAO {

	public List<ReserveSearchPointDTO> searchPoint(SqlSession session, ReserveSearchPointDTO reserveUser) {

		return session.selectList("ReserveDAO.searchPoint", reserveUser);
	}

}
