package com.ssafy.happy.model.dto;

public class JjimDto {

	private String userid;
	private String hno;
	
	public JjimDto() {
	}

	public JjimDto(String userid, String hno) {
		super();
		this.userid = userid;
		this.hno = hno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String gethno() {
		return hno;
	}

	public void sethno(String hno) {
		this.hno = hno;
	}

	@Override
	public String toString() {
		return "JjimDto [userid=" + userid + ", hno=" + hno + "]";
	}
	
	
}
