package org.mas.web.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/home")
public class HomeController {

	private static Logger LOG = Logger.getLogger(HomeController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String showHome() {
		LOG.debug("==============In Home Controller");
		return "home";
	}

}
