package com.formacion.nttdata.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.formacion.nttdata.model.User;
import com.formacion.nttdata.servicio.HelloServicio;



@Controller

public class HomeController {

	/**
	 * 
	 * Simply selects the home view to render by returning its name.
	 * 
	 */
	@Autowired
	private HelloServicio helloServicio;
	
	public HomeController(HelloServicio helloServicio) {
		this.helloServicio = helloServicio;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("Home Page Requested, locale = " + locale);	
		return "home";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String showInfo(String userName, int days, Locale locale, Model model) {
		this.helloServicio.showInfo(userName, days, locale, model);
		return"user";
	}

//	@RequestMapping(value = "/user", method = RequestMethod.POST)
//	public String user(@Validated User user, Model model) {
//		System.out.println("User Page Requested");
//		model.addAttribute("userName", user.getUserName());
//		return "user";
//	}
	
	

}