package com.ssafy.happy.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.model.dto.QnaDto;
import com.ssafy.happy.model.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertQna(QnaDto dto) {
		return sqlSession.getMapper(QnaMapper.class).insertQna(dto);
	}

	@Override
	public List<QnaDto> selectAll() {
		return sqlSession.getMapper(QnaMapper.class).selectAll();
	}
	
	@Override
	public QnaDto selectOne(int bno) {
		return sqlSession.getMapper(QnaMapper.class).selectOne(bno);
	};

	@Override
	public int updateQna(QnaDto dto) {
		return sqlSession.getMapper(QnaMapper.class).updateQna(dto);
	}

	@Override
	public int deleteQna(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(QnaMapper.class).deleteQna(bno);
	}

}
