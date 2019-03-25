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

	public List<Map<String, Object>> searchSubjectList() {
		return studyScheduleMapper.searchSubjectList();
	}
}
