package com.ahohotel.mypage.reserve.model.dto;

import java.io.Serializable;
import java.util.Date;

public class HotelDTO implements Serializable{

	private static final long serialVersionUID = 4372775888779667332L;
	
	private int hoCode;
	private String hoName;
	private String hoStar;
	private String userStar;
	private String hoPhone;
	private String hoAddress;
	private String open;
	private java.util.Date checkIn;
	private java.util.Date checkOut;
	
	public HotelDTO() {
	}

	public HotelDTO(int hoCode, String hoName, String hoStar, String userStar, String hoPhone, String hoAddress,
			String open, Date checkIn, Date checkOut) {
		this.hoCode = hoCode;
		this.hoName = hoName;
		this.hoStar = hoStar;
		this.userStar = userStar;
		this.hoPhone = hoPhone;
		this.hoAddress = hoAddress;
		this.open = open;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
	}

	public int getHoCode() {
		return hoCode;
	}

	public void setHoCode(int hoCode) {
		this.hoCode = hoCode;
	}

	public String getHoName() {
		return hoName;
	}

	public void setHoName(String hoName) {
		this.hoName = hoName;
	}

	public String getHoStar() {
		return hoStar;
	}

	public void setHoStar(String hoStar) {
		this.hoStar = hoStar;
	}

	public String getUserStar() {
		return userStar;
	}

	public void setUserStar(String userStar) {
		this.userStar = userStar;
	}

	public String getHoPhone() {
		return hoPhone;
	}

	public void setHoPhone(String hoPhone) {
		this.hoPhone = hoPhone;
	}

	public String getHoAddress() {
		return hoAddress;
	}

	public void setHoAddress(String hoAddress) {
		this.hoAddress = hoAddress;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public java.util.Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(java.util.Date checkIn) {
		this.checkIn = checkIn;
	}

	public java.util.Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(java.util.Date checkOut) {
		this.checkOut = checkOut;
	}

	@Override
	public String toString() {
		return "HotelDTO [hoCode=" + hoCode + ", hoName=" + hoName + ", hoStar=" + hoStar + ", userStar=" + userStar
				+ ", hoPhone=" + hoPhone + ", hoAddress=" + hoAddress + ", open=" + open + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + "]";
	}
	
	
}
