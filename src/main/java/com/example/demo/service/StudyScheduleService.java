package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.StudyScheduleMapper;
import com.github.pagehelper.Page;

@Service
public class StudyScheduleService {
	
	@Autowired
	private StudyScheduleMapper studyScheduleMapper;

	/**
	 * 과목 리스트
	 */
	public Page<Map<String, Object>> searchSubjectList(Map<String, Object> param) {
		return studyScheduleMapper.searchSubjectList(param);
	}
	
	/**
	 * 유저별 수강신청 리스트
	 */
	public List<Map<String, Object>> searcSubjectForUserList() {
		return studyScheduleMapper.searcSubjectForUserList();
	}
	
	/**
	 * 수강리스트 유저별 비교하기 위한 정보
	 */
	public List<Map<String, Object>> searchCompareSubjectForUserList() {
		return studyScheduleMapper.searchCompareSubjectForUserList();
	}
	
	/**
	 * 유저 수강목록
	 * @return
	 */
	public Page<Map<String, Object>> searchEnroleUserlist() {
		return studyScheduleMapper.searchEnroleUserlist();
	}
	
	/**
	 * 수강신청 등록
	 */
	public void successEnrolementSubject(Map<String, Object> param) {
		
		// 기존 수강 과목이 있으면 삭제
		studyScheduleMapper.removeUserSubjectForBefore(param);
		
		param.put("name", "admin"); // 사용자 어드민으로 등록 (임시)
		studyScheduleMapper.successEnrolementSubject(param);
	}
	
	/**
	 * 내 수강목록에서 삭제
	 * @param param
	 */
	public void removeUserSubject(Map<String, Object> param) {
		studyScheduleMapper.removeUserSubject(param);
	}
}
