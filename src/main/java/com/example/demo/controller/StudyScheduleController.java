package com.example.demo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView indexPage() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping(value = "schedule")
	public ModelAndView scheduleList(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		System.out.println(studyScheduleService.searchSubjectList(param));
		mav.addObject("subjectList", studyScheduleService.searchSubjectList(param));
		return mav;
	}
}
