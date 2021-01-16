package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import redis.clients.jedis.Jedis;

import java.util.Random;

/**
 * @author Wenhao Tong
 * @Description
 * @create 2021-01-16 20:47
 */
@Controller
public class verifyCodeController {

    @RequestMapping(value="/verify/{phone}",method = RequestMethod.POST)
    @ResponseBody
    public boolean verify(@PathVariable("phone")String phone){
        String code = getCode(6);
        System.out.println(code);
        String codeKey = "Verify_code:" + phone + ":code";
        String countKey = "Verify_code:" + phone + ":count";
        System.out.println(codeKey);
        System.out.println(countKey);
        Jedis jedis = new Jedis("82.156.163.81", 6379);
        String count = jedis.get(countKey);
        boolean isFlag = true;
        if (count == null){
            jedis.setex(countKey,24*3600,"0");
        }else if(Integer.parseInt(count) < 2){
            jedis.incr(countKey);
        }else{
            isFlag = false;
        }
        jedis.setex(codeKey,120,code);
        jedis.close();
        return isFlag;
    }

    @RequestMapping(value="/verify/{phone}/{code}",method = RequestMethod.GET)
    @ResponseBody
    public String verifyCode(@PathVariable("phone")String  phone,@PathVariable("code")String code){
        System.out.println("正在验证");
        String codeKey = "Verify_code:" + phone + ":code";
        Jedis jedis = new Jedis("82.156.163.81", 6379);
        String s = jedis.get(codeKey);
        System.out.println(s);
        jedis.close();
        if (s != null && s.equals(code)){
            return "success";
        }else{
            return "fail";
        }
    }



    private String getCode(int length){
        String code = "";
        Random random = new Random();
        for (int i = 0;i < length;i++){
            code += random.nextInt(10);
        }
        return code;
    }


}
