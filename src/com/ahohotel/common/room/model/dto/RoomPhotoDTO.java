package com.ahohotel.common.room.model.dto;

import java.io.Serializable;

public class RoomPhotoDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8119114061721399872L;
	
	private int photoCode;
	private int roomCode;
	private String originalFile;
	private String fileName;
	private String file;
	private String thumbnailYN;
	
	public RoomPhotoDTO() {
	}

	public RoomPhotoDTO(int photoCode, int roomCode, String originalFile, String fileName, String file,
			String thumbnailYN) {
		super();
		this.photoCode = photoCode;
		this.roomCode = roomCode;
		this.originalFile = originalFile;
		this.fileName = fileName;
		this.file = file;
		this.thumbnailYN = thumbnailYN;
	}

	public int getPhotoCode() {
		return photoCode;
	}

	public void setPhotoCode(int photoCode) {
		this.photoCode = photoCode;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getThumbnailYN() {
		return thumbnailYN;
	}

	public void setThumbnailYN(String thumbnailYN) {
		this.thumbnailYN = thumbnailYN;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RoomPhotoDTO [photoCode=" + photoCode + ", roomCode=" + roomCode + ", originalFile=" + originalFile
				+ ", fileName=" + fileName + ", file=" + file + ", thumbnailYN=" + thumbnailYN + "]";
	}
	
	
}
