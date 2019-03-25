package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudyScheduleMapper {
	
	public List<Map<String, Object>> searchSubjectList();
}
