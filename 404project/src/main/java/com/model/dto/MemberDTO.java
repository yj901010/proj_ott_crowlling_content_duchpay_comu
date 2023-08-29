package com.model.dto;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String nick;
	private String gender;
	private int file_no;
	
	




	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", phone=" + phone
				+ ", email=" + email + ", nick=" + nick + ", gender=" + gender + ", file_no=" + file_no + "]";
	}





	public MemberDTO(String id, String pw, String name, String birth, String phone, String email, String nick, String gender) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.nick = nick;
		this.gender = gender;
	}


	


	public MemberDTO(String id, String pw, String name, String birth, String phone, String email, String nick,
			String gender, int file_no) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.nick = nick;
		this.gender = gender;
		this.file_no = file_no;
	}




	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}





	public String getId() {
		return id;
	}


	public String getPw() {
		return pw;
	}


	public String getName() {
		return name;
	}


	public String getBirth() {
		return birth;
	}


	public String getPhone() {
		return phone;
	}


	public String getEmail() {
		return email;
	}


	public String getNick() {
		return nick;
	}


	public String getGender() {
		return gender;
	}





	public int getFile_no() {
		return file_no;
	}
	
	
	
}
