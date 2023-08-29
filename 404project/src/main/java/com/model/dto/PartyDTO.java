package com.model.dto;

public class PartyDTO {
	private int no;
	private String id;
	private int p_no;
	private String start_Date;
	private int period;
	private String post_Date;
	
	public PartyDTO(int no, String id, int p_no, String start_Date, int period, String post_Date) {
		this.no = no;
		this.id = id;
		this.p_no = p_no;
		this.start_Date = start_Date;
		this.period = period;
		this.post_Date = post_Date;
	}
	
	public int getNo() {
		return no;
	}
	public String getId() {
		return id;
	}
	public int getP_no() {
		return p_no;
	}
	public String getStart_Date() {
		return start_Date;
	}
	public String getPost_Date() {
		return post_Date;
	}
	public int getPeriod() {
		return period;
	}
	
	public PartyDTO(int no, String id, int p_no, String start_Date, String post_Date, int period) {
		this.no = no;
		this.id = id;
		this.p_no = p_no;
		this.start_Date = start_Date;
		this.post_Date = post_Date;
		this.period = period;
	}
	public PartyDTO(String id, String start_Date, int period) {
		this.id = id;
		this.start_Date = start_Date;
		this.period = period;
	}

	public PartyDTO(int no, String id) {
		this.no = no;
		this.id = id;
	}
	
	public PartyDTO(String start_Date, int period) {
		this.start_Date = start_Date;
		this.period = period;
	}
}
