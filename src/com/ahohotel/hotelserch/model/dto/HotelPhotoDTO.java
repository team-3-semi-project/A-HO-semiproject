package com.ahohotel.hotelserch.model.dto;

import java.io.Serializable;

public class HotelPhotoDTO implements Serializable {
	
	
	private static final long serialVersionUID = -1950670985697056870L;
	
	private int photoCode;
	private int hotelCode;
	private String originalFile;
	private String fileName;
	private String filePath;
	private String thumbnail_YN;
	
	public HotelPhotoDTO() {
	}

	public HotelPhotoDTO(int photoCode, int hotelCode, String originalFile, String fileName, String filePath,
			String thumbnail_YN) {
		this.photoCode = photoCode;
		this.hotelCode = hotelCode;
		this.originalFile = originalFile;
		this.fileName = fileName;
		this.filePath = filePath;
		this.thumbnail_YN = thumbnail_YN;
	}

	public int getPhotoCode() {
		return photoCode;
	}

	public void setPhotoCode(int photoCode) {
		this.photoCode = photoCode;
	}

	public int getHotelCode() {
		return hotelCode;
	}

	public void setHotelCode(int hotelCode) {
		this.hotelCode = hotelCode;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getThumbnail_YN() {
		return thumbnail_YN;
	}

	public void setThumbnail_YN(String thumbnail_YN) {
		this.thumbnail_YN = thumbnail_YN;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "HotelPhotoDTO [photoCode=" + photoCode + ", hotelCode=" + hotelCode + ", originalFile=" + originalFile
				+ ", fileName=" + fileName + ", filePath=" + filePath + ", thumbnail_YN=" + thumbnail_YN + "]";
	}
	
	

}
