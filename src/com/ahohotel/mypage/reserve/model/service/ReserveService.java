package com.ahohotel.mypage.reserve.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.reserve.model.dao.ReserveDAO;
import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;
import com.ahohotel.mypage.reserve.model.dto.MyReviewDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveSearchListDTO;
import com.ahohotel.mypage.reserve.model.dto.ReviewPhotoDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.dto.ReportDTO;
public class ReserveService {

	private final ReserveDAO reserveDAO;
	
	public ReserveService() {
		reserveDAO = new ReserveDAO();
	}

	public List<ReserveSearchListDTO> searchPoint(int searchUserNo) {
		
		SqlSession session = getSqlSession();
		
		List<ReserveSearchListDTO> reserveList = reserveDAO.searchReservePoint(session, searchUserNo);
		session.close();
		
		return reserveList;
	}

	public AhoUserDTO searchMemberPoint(int searchUserNo) {
		
		SqlSession session = getSqlSession();
		
		AhoUserDTO ahoUser = reserveDAO.searchMemberPoint(session, searchUserNo);
		session.close();
		
		return ahoUser;
	}

	public List<ReserveSearchListDTO> selectMyReserve(int userNum) {
		
		SqlSession session = getSqlSession();
		
		List<ReserveSearchListDTO> reserveList = reserveDAO.selectMyReserve(session, userNum);
		
		session.close();
		
		return reserveList;
	}

	public HotelPhotoDTO selectPhotoPath(int hotelNum) {
		
		SqlSession session = getSqlSession();
		
		HotelPhotoDTO hotelPhoto = reserveDAO.selectPhotoPath(session, hotelNum);
		
		session.close();
		
		return hotelPhoto;
	}

	public ReserveSearchListDTO selectOneReserve(int reserveNum) {
		
		SqlSession session = getSqlSession();
		
		ReserveSearchListDTO reserve = reserveDAO.selectOneReserve(session, reserveNum);
		
		session.close();
		
		return reserve;
	}

	public int insertReview(ReserveDTO review) {
		
		SqlSession session = getSqlSession();
		
		int result = reserveDAO.insertReview(session, review);
		
		if (result > 0) {
			session.commit();
			System.out.println("커밋 성공");
		} else {
			session.rollback();
			System.out.println("실패");
		}
		
		session.close();
		
		return result;
	}

	public int insertReview(ReserveDTO review, List<ReviewPhotoDTO> reviewPhoto) {

		SqlSession session = getSqlSession();
		
		int result = 0;
		
		int reviewResult = reserveDAO.insertReview(session, review);
		
		int rePhotoResult = 0;
		for (int i = 0; i < reviewPhoto.size(); i++) {
			rePhotoResult += reserveDAO.insertReviewPhoto(session, reviewPhoto.get(i));
		}
		
		if (reviewResult > 0 && rePhotoResult == reviewPhoto.size()) {
			session.commit();
			result = 1;
		} else {
			session.rollback();
		}
		
		return result;
	}

	public ReserveDTO selectReserve(int reserveCode) {
		
		SqlSession session = getSqlSession();
		
		ReserveDTO reserve = reserveDAO.selectReserve(session, reserveCode);
		
		session.close();
		
		return reserve;
	}

	public int insertReport(ReportDTO report) {
		
		SqlSession session = getSqlSession();
		
		int result = reserveDAO.insertReport(session, report);
		
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	public List<MyReviewDTO> selectMyReviewList(int user) {
		
		SqlSession session = getSqlSession();
		
		List<MyReviewDTO> reviewList = reserveDAO.selectMyReviewList(session, user);
		
		for (MyReviewDTO review : reviewList) {
			
			List<ReviewPhotoDTO> reviewPhoto = reserveDAO.selectMyReviewPhoto(session, review.getReserveCode());
			
			review.setReviewPhoto(reviewPhoto);
		}
		
		session.close();
		
		return reviewList;
	}

	public int deleteReview(int reserveCode) {
		
		SqlSession session = getSqlSession();
		
		int result = reserveDAO.deleteReview(session, reserveCode);
		
		int rePhotoresult = reserveDAO.deletReviewPhoto(session, reserveCode);
		
		System.out.println("rePhoto" + rePhotoresult);
		
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return result;
	}

	public List<ReviewPhotoDTO> selectReviewPhoto(int reserveCode) {
		
		SqlSession session = getSqlSession();
		
		List<ReviewPhotoDTO> rePhoto = reserveDAO.selectReviewPhoto(session, reserveCode);
		
		session.close();
		
		return rePhoto;
	}

	public int updateReview(ReserveDTO review, List<ReviewPhotoDTO> reviewPhoto) {
		
		SqlSession session = getSqlSession();
		
		int result = 0;
		
		int reviewResult = reserveDAO.updateReview(session, review);
		
		int rePhotoResult = 0;
		for (int i = 0; i < reviewPhoto.size(); i++) {
			rePhotoResult += reserveDAO.insertReviewPhoto(session, reviewPhoto.get(i));
		}
		
		if (reviewResult > 0 && rePhotoResult == reviewPhoto.size()) {
			session.commit();
			result = 1;
		} else {
			session.rollback();
		}
		
		return result;
	}

}
