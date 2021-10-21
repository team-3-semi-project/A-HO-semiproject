package com.ahohotel.hotellist.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.hotellist.model.dto.HotelAndHotelPhotoDTO;
import com.ahohotel.hotellist.model.dto.HotelListDTO;
import com.ahohotel.hotellist.model.dto.HotelReviewListDTO;
import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;
import com.ahohotel.mypage.reserve.model.dto.ReviewPhotoDTO;

public class HotelListDAO {

	public List<HotelListDTO> searchHotelList(SqlSession session, SelectCriteria selectCriteria){
		
		return session.selectList("HotelListDAO.selectHotelList", selectCriteria);
	}

	public HotelPhotoDTO selectMainPhoto(SqlSession session, int hotelNum) {

		return session.selectOne("HotelListDAO.selectMainPhoto", hotelNum);
	}

	public HotelAndHotelPhotoDTO selectHotelPage(SqlSession session, int hotelNum) {

		return session.selectOne("HotelListDAO.selectHotelPage", hotelNum);
	}

	public List<HotelPhotoDTO> selectPhoto(SqlSession session, int hotelNum) {

		return session.selectList("HotelListDAO.selectHotelPhoto", hotelNum);
	}

	public List<HotelReviewListDTO> selectHotelReview(SqlSession session, int hotelNum) {

		return session.selectList("HotelListDAO.selectHotelReview", hotelNum);
	}

	public List<ReviewPhotoDTO> selectReviewPhoto(SqlSession session, int reservePhoto) {

		return session.selectList("HotelListDAO.selectReviewPhoto", reservePhoto);
	}

	
}
