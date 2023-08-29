package com.model.dto;

public class MembershipDTO {
	private int no;
	private String name;
	private String title;
	private int price;
	private int share;
	
	public MembershipDTO(int no, String name, String title, int price, int share) {
		this.no = no;
		this.name = name;
		this.title = title;
		this.price = price;
		this.share = share;
	}

	@Override
	public String toString() {
		return "MembershipDTO [no=" + no + ", name=" + name + ", title=" + title + ", price=" + price + ", share="
				+ share + "]";
	}

	public MembershipDTO(String name) {
		this.name = name;
	}
	
	public MembershipDTO(String name, String title) {
		this.name = name;
		this.title = title;
	}
	
	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

	public int getShare() {
		return share;
	}

	public int getPrice() {
		return price;
	}
	
	
	
}
