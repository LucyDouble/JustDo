package com.kh.jd.account;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
    @RequestMapping(value = "/jdHome", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {

        return "common/main";
    }

    @RequestMapping(value = "/aboutJD", method = RequestMethod.GET)
    public String aboutJD(Locale locale, Model model) {

        return "common/aboutJD";
    }

    @RequestMapping(value = "/aboutTeacher", method = RequestMethod.GET)
    public String aboutTeacher(Locale locale, Model model) {

        return "common/aboutTeacher";
    }

    @RequestMapping(value = "/knowhow", method = RequestMethod.GET)
    public String knowhow(Locale locale, Model model) {

        return "common/knowhow";
    }
    @RequestMapping(value = "/aboutAddress", method = RequestMethod.GET)
    public String aboutAdress(Locale locale, Model model) {
    	
    	return "common/aboutAddress";
    }
	
	
}
