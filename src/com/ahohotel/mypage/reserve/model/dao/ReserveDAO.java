package com.ahohotel.mypage.reserve.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveSearchListDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;

public class ReserveDAO {

	public List<ReserveSearchListDTO> searchReservePoint(SqlSession session, int searchUserNo) {

		return session.selectList("ReserveDAO.searchPoint", searchUserNo);
	}

	public AhoUserDTO searchMemberPoint(SqlSession session, int searchUserNo) {

		return session.selectOne("ReserveDAO.searchMemberPoint", searchUserNo);
	}

	public List<ReserveSearchListDTO> selectMyReserve(SqlSession session, int userNum) {

		return session.selectList("ReserveDAO.selectMyReserve", userNum);
	}

	public HotelPhotoDTO selectPhotoPath(SqlSession session, int hotelNum) {

		return session.selectOne("ReserveDAO.selectPhotoPath", hotelNum);
	}

}
