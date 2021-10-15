package com.ahohotel.common.room.model.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class RoomDTO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8762562016973584654L;
	
	private int roomCode;
	private int hotelCode;
	private String roomName;
	private int roomPrice;
	private int roomCount;

	public RoomDTO() {
	}

	public RoomDTO(int roomCode, int hotelCode, String roomName, int roomPrice, int roomCount) {
		this.roomCode = roomCode;
		this.hotelCode = hotelCode;
		this.roomName = roomName;
		this.roomPrice = roomPrice;
		this.roomCount = roomCount;
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

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomCode=" + roomCode + ", hotelCode=" + hotelCode + ", roomName=" + roomName + ", roomPrice="
				+ roomPrice + ", roomCount=" + roomCount + "]";
	}

	
	
}

	
	