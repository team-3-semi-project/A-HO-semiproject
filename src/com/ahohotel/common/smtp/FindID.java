package com.ahohotel.common.smtp;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class FindID {
	public static void sendEmailMessage(String receiveEmail, String id) {
		// 사용할 메일 - naver
		String host = "smtp.naver.com";

		// 발신자의 메일 계정 및 비밀번호
		String user = "lmksm@naver.com";
		String pwd = "lmkjww0522";

		// SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465); // naver -> 465, ssl 연결 필요
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true"); // ssl 연결 설정
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, pwd);
				}
			});

			MimeMessage msg = new MimeMessage(session);
			try {

				// 발신자 설정
				InternetAddress from = new InternetAddress(user);
				msg.setFrom(from);

				// 수신자 설정
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveEmail));

				// 메일 제목
				msg.setSubject("[A-HO HOTEL] 아이디 찾기 메일입니다.", "UTF-8");
				// 메일 내용
				msg.setText("회원님의 아이디는 " + id + " 입니다", "UTF-8");

				Transport.send(msg);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return;
		}

		/*Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pwd);
			}
		});

		MimeMessage msg = new MimeMessage(session);
		try {

			// 발신자 설정
			InternetAddress from = new InternetAddress(user);
			msg.setFrom(from);

			// 수신자 설정
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveEmail));

			// 메일 제목
			msg.setSubject("[A-HO HOTEL] 아이디 찾기 메일입니다.", "UTF-8");
			// 메일 내용
			msg.setText("회원님의 아이디는 " + id + " 입니다", "UTF-8");

			Transport.send(msg);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}*/
}
