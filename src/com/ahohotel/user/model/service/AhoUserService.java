package com.ahohotel.user.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ahohotel.user.model.dao.AhoUserDAO;
import com.ahohotel.user.model.dto.AhoUserDTO;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

public class AhoUserService {
	
	private final AhoUserDAO userDAO;
	
	public AhoUserService() {
		userDAO = new AhoUserDAO();
	}

	public AhoUserDTO login(AhoUserDTO userDto) {
		
		SqlSession session = getSqlSession();
		AhoUserDTO loginUser = null;
		
		String encPw = userDAO.selectEncryptedPw(session, userDto);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		/* matches 메소드를 통해 입력한 pw와 암호화된 pw와 일치하는지 확인 하고 일치하면 회원 정보를 조회하도록 */
		if(passwordEncoder.matches(userDto.getPw(), encPw)) {
			
			loginUser = userDAO.selectLoginUser(session, userDto);
		}
		
		loginUser = userDAO.selectLoginUser(session, userDto);
	
		session.close();
		
		return loginUser;
	}

	public boolean signUp() {
		return false;
	}

}
