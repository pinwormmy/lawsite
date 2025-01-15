package com.lawsite;

import com.lawsite.util.PageDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(PageDTO page, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "index";
    }

}