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

@Controller
public class StudyScheduleController {
	
	@Autowired
	private StudyScheduleService studyScheduleService;

	@RequestMapping(value = "/")
	public String hello() {
		return "enrolment";
	}
	
	@RequestMapping(value = "enrolment")
	public ModelAndView indexPage(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("subjectList", studyScheduleService.searchSubjectList(param));
		mav.addObject("userList", new JSONArray(studyScheduleService.searcSubjectForUserList()));
		return mav;
	}
	
	@RequestMapping(value = "schedule")
	public ModelAndView scheduleList() {
		ModelAndView mav = new ModelAndView();
		System.out.println(studyScheduleService.searcSubjectForUserList());
		mav.addObject("userList", new JSONArray(studyScheduleService.searcSubjectForUserList()));
		return mav;
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
}
