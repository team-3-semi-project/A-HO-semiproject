package com.ahohotel.hotelserch.model.dto;

import java.io.Serializable;

public class RoomPhotoDTO implements Serializable {

	private static final long serialVersionUID = -8686887357668772023L;

	private int roomPhotoCode;
	private int roomCode;
	private String originalFile;
	private String filename;
	private String filePath;
	
	public RoomPhotoDTO() {
	}

	public RoomPhotoDTO(int roomPhotoCode, int roomCode, String originalFile, String filename, String filePath) {
		this.roomPhotoCode = roomPhotoCode;
		this.roomCode = roomCode;
		this.originalFile = originalFile;
		this.filename = filename;
		this.filePath = filePath;
	}

	public int getRoomPhotoCode() {
		return roomPhotoCode;
	}

	public void setRoomPhotoCode(int roomPhotoCode) {
		this.roomPhotoCode = roomPhotoCode;
	}

	public int getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RoomPhotoDTO [roomPhotoCode=" + roomPhotoCode + ", roomCode=" + roomCode + ", originalFile="
				+ originalFile + ", filename=" + filename + ", filePath=" + filePath + "]";
	}
	
	
	
	
}
