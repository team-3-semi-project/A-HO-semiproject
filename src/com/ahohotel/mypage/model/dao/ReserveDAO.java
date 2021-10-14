package com.ahohotel.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.model.dto.ReserveSearchPointDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;

public class ReserveDAO {

	public List<ReserveSearchPointDTO> searchReservePoint(SqlSession session, int searchUserNo) {

		return session.selectList("ReserveDAO.searchPoint", searchUserNo);
	}

	public AhoUserDTO searchMemberPoint(SqlSession session, int searchUserNo) {

		return session.selectOne("ReserveDAO.searchMemberPoint", searchUserNo);
	}

}
