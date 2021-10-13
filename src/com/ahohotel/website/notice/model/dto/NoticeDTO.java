package com.ahohotel.website.notice.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class NoticeDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6528042310808976111L;
	
	int noticeCode;
	String noticeTitle;
	String noticeContent;
	Date noticeDate;
	int noticeCount;
	
	public NoticeDTO() {
	}
	public NoticeDTO(int noticeCode, String noticeTitle, String noticeContent, Date noticeDate, int noticeCount) {
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeCount = noticeCount;
	}
	
	public int getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeCount() {
		return noticeCount;
	}
	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}
	
	@Override
	public String toString() {
		return "NoticeDTO [noticeCode=" + noticeCode + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", noticeDate=" + noticeDate + ", noticeCount=" + noticeCount + "]";
	}
}
