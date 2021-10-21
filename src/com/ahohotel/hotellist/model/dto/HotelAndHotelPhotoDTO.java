package com.ahohotel.hotellist.model.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;

public class HotelAndHotelPhotoDTO implements Serializable{

	private static final long serialVersionUID = 1079777028530925659L;
	
	private int hoCode;
	private String hoName;
	private String hoStar;
	private String userStar;
	private String hoPhone;
	private String hoAddress;
	private String open;
	private java.util.Date checkIn;
	private java.util.Date checkOut;
	private List<HotelPhotoDTO> hoPhoto;
	
	public HotelAndHotelPhotoDTO() {
	}

	public HotelAndHotelPhotoDTO(int hoCode, String hoName, String hoStar, String userStar, String hoPhone,
			String hoAddress, String open, Date checkIn, Date checkOut, List<HotelPhotoDTO> hoPhoto) {
		this.hoCode = hoCode;
		this.hoName = hoName;
		this.hoStar = hoStar;
		this.userStar = userStar;
		this.hoPhone = hoPhone;
		this.hoAddress = hoAddress;
		this.open = open;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.hoPhoto = hoPhoto;
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

	public List<HotelPhotoDTO> getHoPhoto() {
		return hoPhoto;
	}

	public void setHoPhoto(List<HotelPhotoDTO> hoPhoto) {
		this.hoPhoto = hoPhoto;
	}

	@Override
	public String toString() {
		return "HotelAndHotelPhoto [hoCode=" + hoCode + ", hoName=" + hoName + ", hoStar=" + hoStar + ", userStar="
				+ userStar + ", hoPhone=" + hoPhone + ", hoAddress=" + hoAddress + ", open=" + open + ", checkIn="
				+ checkIn + ", checkOut=" + checkOut + ", hoPhoto=" + hoPhoto + "]";
	}
	
	
}
