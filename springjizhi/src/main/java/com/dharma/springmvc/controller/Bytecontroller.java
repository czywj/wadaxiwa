package com.dharma.springmvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class Bytecontroller {
    @RequestMapping(method = RequestMethod.GET)
    public String Bye(ModelMap model) {
        model.addAttribute("greeting","bye");
        model.addAttribute("ByeBye");
        System.out.println(model.toString());
        return "index";
    }

    @RequestMapping(value = "/bye",method = RequestMethod.GET)
    public String sayThankYou(ModelMap model) {
        model.addAttribute("greeting","thank");
        return "index";
    }
}
