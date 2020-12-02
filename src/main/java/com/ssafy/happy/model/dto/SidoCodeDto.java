package com.ssafy.happy.model.dto;

public class SidoCodeDto {
	private String sido_code;
	private String sido_name;
	
	public SidoCodeDto() {
	}
	
	public SidoCodeDto(String sido_code, String sido_name) {
		super();
		this.sido_code = sido_code;
		this.sido_name = sido_name;
	}
	
	public String getSido_code() {
		return sido_code;
	}
	public void setSido_code(String sido_code) {
		this.sido_code = sido_code;
	}
	public String getSido_name() {
		return sido_name;
	}
	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}

	@Override
	public String toString() {
		return "SidoCodeDto [sido_code=" + sido_code + ", sido_name=" + sido_name + "]";
	}
	
	
}
