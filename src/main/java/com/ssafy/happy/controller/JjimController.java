package com.ssafy.happy.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
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

import com.ssafy.happy.model.dto.HinfoDto;
import com.ssafy.happy.model.dto.JjimDto;
import com.ssafy.happy.model.service.JjimService;

@CrossOrigin(origins = "*")
@RestController 
@RequestMapping("/jjim")
public class JjimController {
	
	@Autowired
	JjimService jservice;
	
	// 찜 많이 받은애 6개
	@GetMapping("/rank")
	protected ResponseEntity<List<HinfoDto>> selectJjimRank() {
		List<HinfoDto> result = jservice.selectJjimRank();
		return new ResponseEntity<List<HinfoDto>>(result, HttpStatus.OK);
	}
	
	// 찜 내가 했는지 안했는지? 했으면 1 안했으면 0
	@PostMapping("/isJjim")
	protected ResponseEntity<Integer> selectIsJjim(@RequestBody JjimDto jjim) {
		int result = jservice.selectIsJjim(jjim);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 찜 취소
	@PostMapping("/delJjim")
	protected ResponseEntity<Integer> deleteJjim(@RequestBody JjimDto jjim) {
		int result = jservice.deleteJjim(jjim);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 찜 하기
	@PostMapping("/insertJjim")
	protected ResponseEntity<List<Integer>> insertJjim(@RequestBody LinkedHashMap input) {
		
		LinkedHashMap Ljjim = (LinkedHashMap)(input.get("jjim"));
		LinkedHashMap Lhinfo = (LinkedHashMap)(input.get("hinfo"));
		
		JjimDto jjim  = new JjimDto();
		jjim.sethno((String)Ljjim.get("hno"));
		jjim.setUserid((String)Ljjim.get("userid"));
		
		HinfoDto hinfo = new HinfoDto();
		hinfo.setHno((String)Lhinfo.get("hno"));
		hinfo.setHname((String)Lhinfo.get("hname"));
		hinfo.setHdong((String)Lhinfo.get("hdong"));
		hinfo.setHwidth((Double)Lhinfo.get("hwidth"));
		hinfo.setHprice((Integer)Lhinfo.get("hprice"));   
		
		List<Integer> result = new ArrayList<>();
		result.add(jservice.insertJjim(jjim));
		if(jservice.isHinfo(hinfo.getHno()) < 1) {
			result.add(jservice.insertHinfo(hinfo));
		}
		return new ResponseEntity<List<Integer>>(result, HttpStatus.OK);
	}
	
	// 내 찜 목록 다 받아오기
	@PostMapping("/list")
	protected ResponseEntity<List<HinfoDto>> selectMyJjim(@RequestBody String userid) {
		String temp = userid.substring(0, userid.length() - 1);
		List<HinfoDto> result = jservice.selectMyJjim(temp);
		return new ResponseEntity<List<HinfoDto>>(result, HttpStatus.OK);
	}
	

}
