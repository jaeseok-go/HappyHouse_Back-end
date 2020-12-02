package com.ssafy.happy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happy.model.dto.DongCodeDto;
import com.ssafy.happy.model.dto.GugunCodeDto;
import com.ssafy.happy.model.dto.SidoCodeDto;
import com.ssafy.happy.model.service.SearchService;

@CrossOrigin(origins = "*")
@RestController 
@RequestMapping("/map")
public class SearchController {
	
	@Autowired
	SearchService sservice;
	
	@PostMapping("/sido")
	protected ResponseEntity<List<SidoCodeDto>> initSido() {
		List<SidoCodeDto> result = sservice.initSido();
		return new ResponseEntity<List<SidoCodeDto>>(result, HttpStatus.OK);
	}
	
	@PostMapping("/gugun")
	protected ResponseEntity<List<GugunCodeDto>> initGugun(@RequestBody String sido_code) {
		List<GugunCodeDto> result = sservice.initGugun(sido_code);
		return new ResponseEntity<List<GugunCodeDto>>(result, HttpStatus.OK);
	}
	
	@PostMapping("/dong")
	protected ResponseEntity<List<DongCodeDto>> initDong(@RequestBody String gugun_code) {
		List<DongCodeDto> result = sservice.initDong(gugun_code);
		return new ResponseEntity<List<DongCodeDto>>(result, HttpStatus.OK);
	}
	@PostMapping("/searchDong")
	protected ResponseEntity<List<DongCodeDto>> searchByDongName(@RequestBody String dong_name) {

		try {
			dong_name = URLDecoder.decode(dong_name, "UTF-8");
			dong_name = dong_name.substring(0, dong_name.length()-1);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<DongCodeDto> result = sservice.searchByDongName(dong_name);
		return new ResponseEntity<List<DongCodeDto>>(result, HttpStatus.OK);
	}

}
