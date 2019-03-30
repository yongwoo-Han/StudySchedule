package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.github.pagehelper.Page;

@Mapper
public interface StudyScheduleMapper {
	
	public List<Map<String, Object>> searcSubjectForUserList();
	public List<Map<String, Object>> searchCompareSubjectForUserList();
	public Page<Map<String, Object>> searchEnroleUserlist();
	public Page<Map<String, Object>> searchSubjectList(Map<String, Object> param);
	
	public void successEnrolementSubject(Map<String, Object> param);
	public void removeUserSubject(Map<String, Object> param);
	public void removeUserSubjectForBefore(Map<String, Object> param);
}
