package com.ssafy.happy.model.service;

import java.util.List;

import com.ssafy.happy.model.dto.HinfoDto;
import com.ssafy.happy.model.dto.JjimDto;

public interface JjimService {

	public List<HinfoDto> selectJjimRank();
	public int selectIsJjim(JjimDto jjim);
	public int deleteJjim(JjimDto jjim);
	public int insertJjim(JjimDto jjim);
	public int insertHinfo(HinfoDto hinfo);
	public int isHinfo(String hno);
	public List<HinfoDto> selectMyJjim(String userid);
}
