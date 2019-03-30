package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.config.ConstType;
import com.example.demo.service.StudyScheduleService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class StudyScheduleController {
	
	@Autowired
	private StudyScheduleService studyScheduleService;
	
	@RequestMapping(value = {"/"})
	public ModelAndView HomePage(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	@RequestMapping(value = {"enrolment"})
	public ModelAndView indexPage(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		PageHelper.startPage(1, 10);
		Page<Map<String,Object>> searchSubjectList = studyScheduleService.searchSubjectList(param);
		Page<Map<String,Object>> searchEnroleUserlist = studyScheduleService.searchEnroleUserlist();
		
		mav.addObject("subjectList", new JSONArray(searchSubjectList));
		mav.addObject("userList", new JSONArray(searchEnroleUserlist));
		
		mav.addObject("subList", searchSubjectList);
		mav.addObject("subPageNumber", searchSubjectList.getPages());
		return mav;
	}
	
	@RequestMapping(value = "schedule")
	public ModelAndView scheduleList() {
		ModelAndView mav = new ModelAndView();
		System.out.println(studyScheduleService.searcSubjectForUserList());
		mav.addObject("userList", new JSONArray(studyScheduleService.searcSubjectForUserList()));
		return mav;
	}
	
	@RequestMapping(value = "/page/enrolment")
	public ResponseEntity<?> pagingEnrolment(@RequestParam Map<String, Object> param) {
		PageHelper.startPage(Integer.parseInt((String)param.get("pageNum")), 10);
		Page<Map<String,Object>> searchSubjectList = studyScheduleService.searchSubjectList(param);
		return ResponseEntity.ok(searchSubjectList);
	}
	
	@RequestMapping(value = "/data/successEnrolementSubject")
	public ResponseEntity<?> successEnrolementSubject(@RequestParam Map<String, Object> param) {
		Map<String, Object> returnMessage = new HashMap<>();
		try {
			studyScheduleService.successEnrolementSubject(param);
			returnMessage.put("message", ConstType.SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			returnMessage.put("message", e.getMessage());
		}
		return ResponseEntity.ok(returnMessage);
	}
	
	@RequestMapping(value = "/data/removeUserSubject")
	public ResponseEntity<?> removeUserSubject(@RequestParam Map<String, Object> param) {
		Map<String, Object> returnMessage = new HashMap<>();
		try {
			studyScheduleService.removeUserSubject(param);
			returnMessage.put("message", ConstType.SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			returnMessage.put("message", e.getMessage());
		}
		return ResponseEntity.ok(returnMessage);
	}
	
	/**
	 * 유저 수강목록 - Ajax
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/data/searchEnroleUserlist")
	public ResponseEntity<?> searchEnroleUserlist() {
		return ResponseEntity.ok(studyScheduleService.searchEnroleUserlist());
	}
	
	/**
	 * 수강목록 검사 - Ajax
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/data/searchSubjectList")
	public ResponseEntity<?> searchSubjectList(@RequestParam Map<String, Object> param) {
		Map<String, Object> resultData = new HashMap<>();
		
		PageHelper.startPage(1, 10);
		Page<Map<String,Object>> searchSubjectList = studyScheduleService.searchSubjectList(param);
		
		resultData.put("subjectList", searchSubjectList);
		resultData.put("totalPageNum", searchSubjectList.getPages());
		return ResponseEntity.ok(resultData);
	}
}
