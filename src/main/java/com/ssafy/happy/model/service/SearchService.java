package com.ssafy.happy.model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.ssafy.happy.model.dto.DongCodeDto;
import com.ssafy.happy.model.dto.GugunCodeDto;
import com.ssafy.happy.model.dto.SidoCodeDto;

public interface SearchService {

	public List<SidoCodeDto> initSido();
	public List<GugunCodeDto> initGugun(String sido_code);
	public List<DongCodeDto> initDong(String gugun_code);
	public List<DongCodeDto> searchByDongName(String dong_name);
}
