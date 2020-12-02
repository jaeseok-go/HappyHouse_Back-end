package com.ssafy.happy.model.dto;

public class HinfoDto {
	private String hno;
	private String hname;
	private String hdong;
	private double hwidth;
	private int hprice;
	private int count;
	
	public HinfoDto() {
		
	}

	public HinfoDto(String hno, String hname, String hdong, double hwidth, int hprice) {
		super();
		this.hno = hno;
		this.hname = hname;
		this.hdong = hdong;
		this.hwidth = hwidth;
		this.hprice = hprice;
	}
	
	public HinfoDto(String hno, String hname, String hdong, double hwidth, int hprice, int count) {
		super();
		this.hno = hno;
		this.hname = hname;
		this.hdong = hdong;
		this.hwidth = hwidth;
		this.hprice = hprice;
		this.count = count;
	}

	public String getHno() {
		return hno;
	}

	public void setHno(String hno) {
		this.hno = hno;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHdong() {
		return hdong;
	}

	public void setHdong(String hdong) {
		this.hdong = hdong;
	}

	public double getHwidth() {
		return hwidth;
	}

	public void setHwidth(double hwidth) {
		this.hwidth = hwidth;
	}

	public int getHprice() {
		return hprice;
	}

	public void setHprice(int hprice) {
		this.hprice = hprice;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "HinfoDto [hno=" + hno + ", hname=" + hname + ", hdong=" + hdong + ", hwidth=" + hwidth + ", hprice="
				+ hprice + ", count=" + count + "]";
	}

}
