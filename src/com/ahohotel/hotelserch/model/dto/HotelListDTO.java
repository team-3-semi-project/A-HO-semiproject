package com.ahohotel.hotelserch.model.dto;

import java.sql.Date;
import java.util.List;

public class HotelListDTO {
	private int hotelCode;
	private String hotelName;
	private String hotelStar;
	private int hotelUserAvg;
	private String hotelPhone;
	private String hotelAddress;
	private String hotelOpen;
	private String checkIn;
	private String checkOut;
	private double latitude;
	private double longitude;
	private String introduce;
	private List<RoomListDTO> room;
	private List<HotelPhotoDTO> hotelPhoto;
	
	
	public HotelListDTO() {

	}


	public HotelListDTO(int hotelCode, String hotelName, String hotelStar, int hotelUserAvg, String hotelPhone,
			String hotelAddress, String hotelOpen, String checkIn, String checkOut, double latitude, double longitude,
			String introduce, List<RoomListDTO> room, List<HotelPhotoDTO> hotelPhoto) {
		this.hotelCode = hotelCode;
		this.hotelName = hotelName;
		this.hotelStar = hotelStar;
		this.hotelUserAvg = hotelUserAvg;
		this.hotelPhone = hotelPhone;
		this.hotelAddress = hotelAddress;
		this.hotelOpen = hotelOpen;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.latitude = latitude;
		this.longitude = longitude;
		this.introduce = introduce;
		this.room = room;
		this.hotelPhoto = hotelPhoto;
	}


	public int getHotelCode() {
		return hotelCode;
	}


	public void setHotelCode(int hotelCode) {
		this.hotelCode = hotelCode;
	}


	public String getHotelName() {
		return hotelName;
	}


	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}


	public String getHotelStar() {
		return hotelStar;
	}


	public void setHotelStar(String hotelStar) {
		this.hotelStar = hotelStar;
	}


	public int getHotelUserAvg() {
		return hotelUserAvg;
	}


	public void setHotelUserAvg(int hotelUserAvg) {
		this.hotelUserAvg = hotelUserAvg;
	}


	public String getHotelPhone() {
		return hotelPhone;
	}


	public void setHotelPhone(String hotelPhone) {
		this.hotelPhone = hotelPhone;
	}


	public String getHotelAddress() {
		return hotelAddress;
	}


	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}


	public String getHotelOpen() {
		return hotelOpen;
	}


	public void setHotelOpen(String hotelOpen) {
		this.hotelOpen = hotelOpen;
	}


	public String getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}


	public String getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}


	public double getLatitude() {
		return latitude;
	}


	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}


	public double getLongitude() {
		return longitude;
	}


	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public List<RoomListDTO> getRoom() {
		return room;
	}


	public void setRoom(List<RoomListDTO> room) {
		this.room = room;
	}


	public List<HotelPhotoDTO> getHotelPhoto() {
		return hotelPhoto;
	}


	public void setHotelPhoto(List<HotelPhotoDTO> hotelPhoto) {
		this.hotelPhoto = hotelPhoto;
	}


	@Override
	public String toString() {
		return "HotelListDTO [hotelCode=" + hotelCode + ", hotelName=" + hotelName + ", hotelStar=" + hotelStar
				+ ", hotelUserAvg=" + hotelUserAvg + ", hotelPhone=" + hotelPhone + ", hotelAddress=" + hotelAddress
				+ ", hotelOpen=" + hotelOpen + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", latitude="
				+ latitude + ", longitude=" + longitude + ", introduce=" + introduce + ", room=" + room
				+ ", hotelPhoto=" + hotelPhoto + "]";
	}

	
}
