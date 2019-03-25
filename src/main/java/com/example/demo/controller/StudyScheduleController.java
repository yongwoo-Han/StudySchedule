package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(value = "scheduleList")
	public ModelAndView scheduleList() {
//		System.out.println(studyScheduleService.searchSubjectList());
		return new ModelAndView();
	}
}
