package kr.ed.haebeop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String home() throws Exception{
        return "/index";
    }

    @RequestMapping("contact")
    public String contact() throws Exception{
        return "/contact/map";
    }

    @RequestMapping("bgimgTest")
    public String bgimgTest() throws Exception{
        return "/test/bgimgTest";
    }
}