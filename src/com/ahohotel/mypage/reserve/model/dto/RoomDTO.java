package com.ahohotel.mypage.reserve.model.dto;

import java.io.Serializable;

public class RoomDTO implements Serializable{

	private static final long serialVersionUID = 7111533701714425443L;
	
	private int roomCode;
	private int hotelCode;
	private String roomName;
	private int price;
	private int count;
	
	public RoomDTO() {
	}

	public RoomDTO(int roomCode, int hotelCode, String roomName, int price, int count) {
		this.roomCode = roomCode;
		this.hotelCode = hotelCode;
		this.roomName = roomName;
		this.price = price;
		this.count = count;
	}

	public int getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}

	public int getHotelCode() {
		return hotelCode;
	}

	public void setHotelCode(int hotelCode) {
		this.hotelCode = hotelCode;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomCode=" + roomCode + ", hotelCode=" + hotelCode + ", roomName=" + roomName + ", price="
				+ price + ", count=" + count + "]";
	}
	
	
}
