package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.StudyScheduleMapper;

@Service
public class StudyScheduleService {
	
	@Autowired
	private StudyScheduleMapper studyScheduleMapper;

	/**
	 * 과목 리스트
	 */
	public List<Map<String, Object>> searchSubjectList(Map<String, Object> param) {
		return studyScheduleMapper.searchSubjectList(param);
	}
	
	/**
	 * 유저별 수강신청 리스트
	 */
	public List<Map<String, Object>> searcSubjectForUserList() {
		return studyScheduleMapper.searcSubjectForUserList();
	}
}
