package com.ahohotel.user.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.user.model.dto.AhoUserDTO;

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

}
