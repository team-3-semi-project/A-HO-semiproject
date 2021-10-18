package com.ahohotel.user.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.dto.ReportDTO;
import com.ahohotel.user.model.dto.ReportListDTO;

public class AhoUserDAO {

	/* 로그인 시 비밀번호(암호화) 확인 메소드 */
	public String selectEncryptedPw(SqlSession session, AhoUserDTO userDto) {
		
		return session.selectOne("AhoUserDAO.selectEncryptedPw", userDto);
	}
	
	
	/* 로그인 한 회원 정보 조회 메소드 */
	public AhoUserDTO selectLoginUser(SqlSession session, AhoUserDTO userDto) {
		
		return session.selectOne("AhoUserDAO.selectLoginUser", userDto);
	}


	public String selectCheckId(SqlSession session, String id) {

		
		return session.selectOne("AhoUserDAO.selectCheckId", id);
	}


	public int insertNewUser(SqlSession session, AhoUserDTO signupDTO) {
		

		return session.insert("AhoUserDAO.insertNewUser", signupDTO);
				
	}


	public String findId(SqlSession session, String mail) {
		
		return session.selectOne("AhoUserDAO.findId", mail);
	}


	public String findEmailById(SqlSession session, String id) {
		
		return session.selectOne("AhoUserDAO.findEmailById", id);
	}


	public int resetPw(SqlSession session, AhoUserDTO resetPw) {

		return session.update("AhoUserDAO.resetPw", resetPw);
	}


	public int selectUserTotalCount(SqlSession session, Map<String, String> searchMap) {
		
		return session.selectOne("AhoUserDAO.selectUserTotalCount", searchMap);
	}


	public List<AhoUserDTO> selectUserList(SqlSession session, SelectCriteria selectCriteria) {
		
		return session.selectList("AhoUserDAO.selectUserList", selectCriteria);
	}


	public AhoUserDTO selectUserDetail(SqlSession session, String code) {
		
		return session.selectOne("AhoUserDAO.selectUserDetail", code);
	}


	public int selectReportTotalCount(SqlSession session, Map<String, String> searchMap) {
		System.out.println("test");
		return session.selectOne("AhoUserDAO.selectReportTotalCount", searchMap);
	}


	public List<ReportListDTO> selectReporList(SqlSession session, SelectCriteria selectCriteria) {
		
		return session.selectList("AhoUserDAO.selectReporList", selectCriteria);
	}


	public int checkReport(SqlSession session, Map<String, String> reportMap) {
		
		return session.update("AhoUserDAO.checkReport", reportMap);
	}


	public int updateBlackList(SqlSession session, Map<String, String> blackListMap) {
		
		return session.update("AhoUserDAO.updateBlackList", blackListMap);
	}


	public int blackListCancle(SqlSession session, String blacklistcancle) {
		
		return session.update("AhoUserDAO.blackListCancle", blacklistcancle);
	}
	
}
