package com.ssafy.happy.model.mapper;

import java.util.List;

import com.ssafy.happy.model.dto.QnaDto;

public interface QnaMapper {
	
	int insertQna(QnaDto dto); // Create
	List<QnaDto> selectAll();  // Read
	QnaDto selectOne(int bno);  	   // Read
	int updateQna(QnaDto dto); // Update
	int deleteQna(int bno);    // Delete
}
