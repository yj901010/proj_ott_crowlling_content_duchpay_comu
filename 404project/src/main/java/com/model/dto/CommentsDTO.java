package com.model.dto;

public class CommentsDTO {

	private int no;
	private String id;
	private String content;
	private String postDate;
	private int postNo;
	
	
	public CommentsDTO(int no, String id, String content, String postDate, int postNo) {
		this.no = no;
		this.id = id;
		this.content = content;
		this.postDate = postDate;
		this.postNo = postNo;
	}


	public CommentsDTO(String id, String content, int postNo) {
		this.id = id;
		this.content = content;
		this.postNo = postNo;
	}


	public CommentsDTO(int no, String id, String content, int postNo) {
		this.no = no;
		this.id = id;
		this.content = content;
		this.postNo = postNo;
	}


	public CommentsDTO(int no, String id, String content) {
		this.no = no;
		this.id = id;
		this.content = content;
	}


	public int getNo() {
		return no;
	}


	public String getId() {
		return id;
	}


	public String getContent() {
		return content;
	}


	public String getPostDate() {
		return postDate;
	}


	public int getPostNo() {
		return postNo;
	}
	
	
	
}
