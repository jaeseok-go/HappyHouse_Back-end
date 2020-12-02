package com.ssafy.happy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happy.model.dto.QnaDto;
import com.ssafy.happy.model.service.QnaService;

@CrossOrigin(origins = "*")
@RestController 
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qservice;
	
	// 게시글 등록
	@PostMapping("/create")
	protected ResponseEntity<Integer> insertQna(@RequestBody QnaDto dto) {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String regdate = dateFormat.format(date);
		dto.setRegdate(regdate);
		int result = qservice.insertQna(dto);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 게시글 목록
	@GetMapping("/read")
	protected ResponseEntity<List<QnaDto>> readQna() {
		List<QnaDto> result = qservice.selectAll();
		if(result.isEmpty()) {
			return new ResponseEntity<List<QnaDto>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<QnaDto>>(result, HttpStatus.OK);
	}
	
	// 게시글 상세검색
	@GetMapping("/detail/{bno}")
	protected ResponseEntity<QnaDto> readQnaOne(@PathVariable("bno") int bno) {
		QnaDto result = qservice.selectOne(bno);
		System.out.println(result.toString());
		if(result == null) {
			System.out.println();
			return new ResponseEntity<QnaDto>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<QnaDto>(result, HttpStatus.OK);
	}
	
	// 게시글 수정
	@PutMapping("/update")
	protected ResponseEntity<Integer> updateQna(@RequestBody QnaDto dto) {
		System.out.println(dto);
		int result = qservice.updateQna(dto);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 게시글 삭제
	@DeleteMapping("/delete/{bno}")
	protected ResponseEntity<Integer> deleteQna(@PathVariable("bno") int bno) {
		System.out.println(bno);
		int result = qservice.deleteQna(bno);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
}
