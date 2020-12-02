package com.ssafy.happy.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happy.model.dto.MemberDto;
import com.ssafy.happy.model.service.JwtService;
import com.ssafy.happy.model.service.MemberService;

@CrossOrigin(origins = "*")
@RestController 
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	JwtService jservice;

	@Autowired
	MemberService mservice;
	
	// 회원가입
	@PostMapping("/join")
	protected ResponseEntity<Integer> joinMember(@RequestBody MemberDto dto) {
		int result = mservice.joinMember(dto);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 회원정보 조회(로그인) + 토큰 생성 및 전달
	@PostMapping("/select")
	protected ResponseEntity<Map<String, Object>> readOneMember(@RequestBody MemberDto memberDto, HttpServletResponse response, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		try {
			
			MemberDto user = mservice.selectOne(memberDto.getUserid());
			System.out.println("requestBody : " + memberDto.toString());
			System.out.println("result : " + user.toString());
			if(user != null) {
				String token = jservice.create(user);

				resultMap.put("auth-token", token);
				resultMap.put("user-id", user.getUserid());
				resultMap.put("user-pw", user.getUserpw());
				resultMap.put("user-name", user.getUsername());
				
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", "로그인 실패");
				status = HttpStatus.ACCEPTED;
			}
			
		} catch (Exception e){
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	// 회원정보 수정
	@PutMapping("/update")
	protected ResponseEntity<Integer> updateMember(@RequestBody MemberDto dto) {
		int result = mservice.updateMember(dto);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 회원정보 삭제
	@PostMapping("/delete")
	protected ResponseEntity<Integer> deleteMember(@RequestBody String userid) {
		
		StringBuilder sb = new StringBuilder();
		sb.append(userid);
		sb.deleteCharAt(sb.length() - 1);
		System.out.println(sb);
		
		int result = mservice.deleteMember(sb.toString());
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
}
