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
	private Date checkIn;
	private Date checkOut;
	private List<RoomListDTO> room;
	
	
	public HotelListDTO() {

	}


	public HotelListDTO(int hotelCode, String hotelName, String hotelStar, int hotelUserAvg, String hotelPhone,
			String hotelAddress, String hotelOpen, Date checkIn, Date checkOut, List<RoomListDTO> room) {
		this.hotelCode = hotelCode;
		this.hotelName = hotelName;
		this.hotelStar = hotelStar;
		this.hotelUserAvg = hotelUserAvg;
		this.hotelPhone = hotelPhone;
		this.hotelAddress = hotelAddress;
		this.hotelOpen = hotelOpen;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.room = room;
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


	public Date getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}


	public Date getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}


	public List<RoomListDTO> getRoom() {
		return room;
	}


	public void setRoom(List<RoomListDTO> room) {
		this.room = room;
	}


	@Override
	public String toString() {
		return "HotelListDTO [hotelCode=" + hotelCode + ", hotelName=" + hotelName + ", hotelStar=" + hotelStar
				+ ", hotelUserAvg=" + hotelUserAvg + ", hotelPhone=" + hotelPhone + ", hotelAddress=" + hotelAddress
				+ ", hotelOpen=" + hotelOpen + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", room=" + room
				+ "]";
	}

	
}
