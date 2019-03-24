package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudyScheduleController {

	@RequestMapping(value = "/")
	public String hello() {
		return "index";
	}
	
	@RequestMapping(value = "index")
	public ModelAndView indexPage() {
		return new ModelAndView();
	}
}
