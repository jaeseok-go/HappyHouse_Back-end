package com.ssafy.happy.model.service;

import java.util.List;

import com.ssafy.happy.model.dto.QnaDto;

public interface QnaService {

	int insertQna(QnaDto dto); // Create
	List<QnaDto> selectAll();  // Read
	QnaDto selectOne(int bno); // Read
	int updateQna(QnaDto dto); // Update
	int deleteQna(int bno);    // Delete
	
}
