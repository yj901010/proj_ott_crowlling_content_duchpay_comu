package com.model.dto;

public class BoardFileDTO {
	private int no;
	private String original_name;
	private String file_name;
	private String path;
	
	public BoardFileDTO(int no, String original_name, String file_name, String path) {
		this.no = no;
		this.original_name = original_name;
		this.file_name = file_name;
		this.path = path;
	}

	
	public BoardFileDTO(String original_name, String file_name, String path) {
		this.original_name = original_name;
		this.file_name = file_name;
		this.path = path;
	}


	public int getNo() {
		return no;
	}

	public String getOriginal_name() {
		return original_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public String getPath() {
		return path;
	}
	

	
	
	
}
