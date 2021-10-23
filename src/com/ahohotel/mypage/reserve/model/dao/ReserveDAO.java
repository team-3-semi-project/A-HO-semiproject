package com.ahohotel.mypage.reserve.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;
import com.ahohotel.mypage.reserve.model.dto.MyReviewDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveSearchListDTO;
import com.ahohotel.mypage.reserve.model.dto.ReviewPhotoDTO;
import com.ahohotel.mypage.reserve.model.dto.UserDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.dto.ReportDTO;

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

	public ReserveSearchListDTO selectOneReserve(SqlSession session, int reserveNum) {

		return session.selectOne("ReserveDAO.selectOneReserve", reserveNum);
	}

	public int insertReview(SqlSession session, ReserveDTO review) {
		
		return session.update("ReserveDAO.insertReview", review);
	}

	public int insertReviewPhoto(SqlSession session, ReviewPhotoDTO reviewPhotoDTO) {
	
		return session.insert("ReserveDAO.insertReviewPhoto", reviewPhotoDTO);
	}

	public ReserveDTO selectReserve(SqlSession session, int reserveCode) {
		
		return session.selectOne("ReserveDAO.selectReserve", reserveCode);
	}

	public int insertReport(SqlSession session, ReportDTO report) {
		
		return session.insert("ReserveDAO.insertReport", report);
	}

	public List<MyReviewDTO> selectMyReviewList(SqlSession session, int user) {
		
		return session.selectList("ReserveDAO.selectMyReviewList", user);
	}

	public List<ReviewPhotoDTO> selectMyReviewPhoto(SqlSession session, int reserveCode) {

		return session.selectList("ReserveDAO.selectMyReviewPhoto", reserveCode);
	}

	public int deleteReview(SqlSession session, int reserveCode) {
		
		return session.update("ReserveDAO.deleteReview", reserveCode);
	}

	public List<ReviewPhotoDTO> selectReviewPhoto(SqlSession session, int reserveCode) {
		
		return session.selectList("ReserveDAO.selectReviewPhoto", reserveCode);
	}

	public int deletReviewPhoto(SqlSession session, int reserveCode) {

		return session.delete("ReserveDAO.deletReviewPhoto", reserveCode);
	}

	public int updateReview(SqlSession session, ReserveDTO review) {
		
		return session.update("ReserveDAO.updateReview", review);
	}

	public ReserveDTO selectCancleReserve(SqlSession session, int reserveCode) {

		return session.selectOne("ReserveDAO.selectCancleReserve", reserveCode);
	}

	public UserDTO selectUser(SqlSession session, int user) {
		
		return session.selectOne("ReserveDAO.selectUser", user);
	}


	public int updatePoint(SqlSession session, UserDTO member) {

		return session.update("ReserveDAO.updatePoint", member);
	}

	public int deleteReserve(SqlSession session, int reserveCode) {

		return session.delete("ReserveDAO.deleteReserve", reserveCode);
	}

}
