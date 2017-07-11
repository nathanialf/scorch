package com.revature.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/logout")
public class LogoutController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String getLogoutPage(HttpSession session) {
		
		session.invalidate();
		
		return "login";
	}
}
