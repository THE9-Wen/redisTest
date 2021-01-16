package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author Wenhao Tong
 * @Description
 * @create 2021-01-16 20:47
 */
@Controller
public class verifyCodeController {

    @RequestMapping(value="/verify",method = RequestMethod.POST)
    public String verify(){
        System.out.println("验证中......");
        return "success";
    }

}
