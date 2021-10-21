package com.ahohotel.book.model.dto;

import java.io.Serializable;

public class BookingHotelDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8530178818357567542L;
	
	private int hotelCode;
	private String hotelName;
	
	public BookingHotelDTO() {
	}
	public BookingHotelDTO(int hotelCode, String hotelName) {
		this.hotelCode = hotelCode;
		this.hotelName = hotelName;
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
	
	@Override
	public String toString() {
		return "BookHotelDTO [hotelCode=" + hotelCode + ", hotelName=" + hotelName + "]";
	}
}
