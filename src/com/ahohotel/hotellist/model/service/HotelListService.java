package com.ahohotel.hotellist.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.hotellist.model.dao.HotelListDAO;
import com.ahohotel.hotellist.model.dto.HotelAndHotelPhotoDTO;
import com.ahohotel.hotellist.model.dto.HotelReviewListDTO;
import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;
import com.ahohotel.mypage.reserve.model.dto.ReviewPhotoDTO;

public class HotelListService {
	
	private final HotelListDAO hotelDAO;
	
	public HotelListService() {
		hotelDAO = new HotelListDAO();
	}

	public HotelPhotoDTO selectMainPhoto(int hotelNum) {
		
		SqlSession session = getSqlSession();
		
		HotelPhotoDTO hotelMainPhoto = hotelDAO.selectMainPhoto(session, hotelNum);
		
		session.close();
		
		
		return hotelMainPhoto;
	}

	public HotelAndHotelPhotoDTO selectHotelPage(int hotelNum) {
		
		SqlSession session = getSqlSession();
		
		HotelAndHotelPhotoDTO hotel = hotelDAO.selectHotelPage(session, hotelNum); 
		
		List<HotelPhotoDTO> hotelPhoto = hotelDAO.selectPhoto(session, hotelNum);
		
		hotel.setHoPhoto(hotelPhoto);
		
		System.out.println(hotel);
		session.close();
		
		return hotel;
	}

	public List<HotelReviewListDTO> selectHotelReview(int hotelNum) {

		SqlSession session = getSqlSession();
		
		List<HotelReviewListDTO> hotelReviewList = hotelDAO.selectHotelReview(session, hotelNum);
		for (HotelReviewListDTO hotel : hotelReviewList) {
			int reservePhoto = hotel.getReserveCode();
			List<ReviewPhotoDTO> reviewPhoto = hotelDAO.selectReviewPhoto(session, reservePhoto);
			hotel.setReviewPhotoList(reviewPhoto);
		}
		
		System.out.println("호텔리뷰리스트" + hotelReviewList);
		
		session.close();
		
		return hotelReviewList;
	}
	
	
}
