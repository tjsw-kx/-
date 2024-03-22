package com.graduation.controller.mobile;

import com.graduation.config.Contants;
import com.graduation.model.CustomerEntity;
import com.graduation.model.XinwenEntity;
import com.graduation.service.XinwenService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 首页
 */
@Controller
public class HomeController {

	

    /**
     * 首页
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/")
    public String home(Model model,HttpServletRequest request)throws Exception{
        CustomerEntity customerEntity = Contants.getCustomer();
        if(customerEntity!=null){
            model.addAttribute("customer",customerEntity);
        }
        
        return "shoping/index";
    }


    

}
