package com.ssafy.happy.model.dto;

public class MemberDto {

	private String userid;
	private String userpw;
	private String username;
	
	public MemberDto() {
		
	}
	
	public MemberDto(String userid, String userpw) {
		this.userid = userid;
		this.userpw = userpw;
	}
	
	public MemberDto(String userid, String userpw, String username) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + "]";
	}
	
	
}
