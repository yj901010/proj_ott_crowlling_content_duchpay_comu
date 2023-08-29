package com.model.dto;

public class PostDTO {
	private int no;
	private String title;
	private String id;
	private String content;
	private String post_Date;
	private int p_View;
	private int p_Like;
	private int file_no;
	
	
	@Override
	public String toString() {
		return "PostDTO [no=" + no + ", title=" + title + ", id=" + id + ", content=" + content + ", post_Date="
				+ post_Date + ", p_View=" + p_View + ", p_Like=" + p_Like + ", file_no=" + file_no + "]";
	}



	public PostDTO(int no, String title, String id, String content, String post_Date, int p_View, int p_Like, int file_no) {
		this.no = no;
		this.title = title;
		this.id = id;
		this.content = content;
		this.post_Date = post_Date;
		this.p_View = p_View;
		this.p_Like = p_Like;
		this.file_no = file_no;
	}

	

	public PostDTO(String title, String id, String content, int p_View, int p_Like, int file_no) {
		this.title = title;
		this.id = id;
		this.content = content;
		this.p_View = p_View;
		this.p_Like = p_Like;
		this.file_no = file_no;
	}



	public PostDTO(String title, String id, String content, int p_View, int p_Like) {
		this.title = title;
		this.id = id;
		this.content = content;
		this.p_View = p_View;
		this.p_Like = p_Like;
	}



	public int getNo() {
		return no;
	}

	public String getTitle() {
		return title;
	}

	public String getId() {
		return id;
	}

	public String getContent() {
		return content;
	}

	public String getPost_Date() {
		return post_Date;
	}

	public int getP_View() {
		return p_View;
	}

	public int getP_Like() {
		return p_Like;
	}



	public int getFile_no() {
		return file_no;
	}
	
}
