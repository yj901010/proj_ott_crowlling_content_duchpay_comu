package com.model.dto;

public class PlatformDTO {
	private int no;
	private String plateform_Name;
	public PlatformDTO(int no, String plateform_Name) {
		this.no = no;
		this.plateform_Name = plateform_Name;
	}
	public int getNo() {
		return no;
	}
	public String getPlateform_Name() {
		return plateform_Name;
	}
	
	
}
