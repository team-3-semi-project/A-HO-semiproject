package com.ahohotel.hotelserch.model.dto;

import java.io.Serializable;
import java.util.List;

import com.ahohotel.user.model.dto.ReserveAndReportDTO;

public class RoomListDTO implements Serializable{
	
	private static final long serialVersionUID = -3771233862262051483L;
	
	private int roomCode;
	private int hotelCode;
	private String roomName;
	private int price;
	private int count;
	private int roomPerson;
	private List<RoomPhotoDTO> roomPhoto;
	private List<ReserveAndReportDTO> reserve;
	
	public RoomListDTO() {
	}

	public RoomListDTO(int roomCode, int hotelCode, String roomName, int price, int count, int roomPerson,
			List<RoomPhotoDTO> roomPhoto, List<ReserveAndReportDTO> reserve) {
		this.roomCode = roomCode;
		this.hotelCode = hotelCode;
		this.roomName = roomName;
		this.price = price;
		this.count = count;
		this.roomPerson = roomPerson;
		this.roomPhoto = roomPhoto;
		this.reserve = reserve;
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

	public int getRoomPerson() {
		return roomPerson;
	}

	public void setRoomPerson(int roomPerson) {
		this.roomPerson = roomPerson;
	}

	public List<RoomPhotoDTO> getRoomPhoto() {
		return roomPhoto;
	}

	public void setRoomPhoto(List<RoomPhotoDTO> roomPhoto) {
		this.roomPhoto = roomPhoto;
	}

	public List<ReserveAndReportDTO> getReserve() {
		return reserve;
	}

	public void setReserve(List<ReserveAndReportDTO> reserve) {
		this.reserve = reserve;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RoomListDTO [roomCode=" + roomCode + ", hotelCode=" + hotelCode + ", roomName=" + roomName + ", price="
				+ price + ", count=" + count + ", roomPerson=" + roomPerson + ", roomPhoto=" + roomPhoto + ", reserve="
				+ reserve + "]";
	}
	

}
