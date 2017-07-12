package com.revature.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.revature.bean.Batch;
import com.revature.bean.User;
import com.revature.service.BatchService;

@Controller
@RequestMapping(value="/batch")
public class BatchController {
	
	@Autowired 
	BatchService batchService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getBatchPage(HttpSession session){
		System.out.println("GET: /batch");
		
		
		List<User> aUsers = batchService.getAssociates();
		System.out.println(aUsers);
		
		session.setAttribute("associates", aUsers);
		
		return "batch";
	}
		
	
	@RequestMapping(method = RequestMethod.POST)
	public String doNewBatch(@Valid Batch batch, HttpSession session, HttpServletRequest request){
		System.out.println("POST: /batch");
		
		
		List<User> associates = (List<User>)session.getAttribute("associates");
				
		String[] options = request.getParameterValues("selectedAssoc");
		for(String option : options){
			System.out.println("The selected associates to be put in a set: "+option);
		}
		
		//batch.getAssociates();

		System.out.println("The full list: " + associates);
		
		batchService.createBatch(batch);
		
		return "batch";
	}
}
