package com.hubu.online.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hubu.online.entity.Student;
import com.hubu.online.service.CourseMenuService;

@Controller
@RequestMapping("/users")
public class StudentController extends BaseController{
	
	@Autowired
	private CourseMenuService courseMenuService;
	
	@RequestMapping("/index")
	public String index(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
    		model.addAttribute("menu", courseMenuService.list());
    		return "/user/index.html";
        }else {
        	Student user2 = new Student();
			user2.setUsername("游客");
			user2.setUserId(-1);
			model.addAttribute("user", user2);
			model.addAttribute("menu", courseMenuService.list());
			return "default/login.html";
        }
		
	}
	
	@RequestMapping("/order")
	public String order(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
		if(object != null) {
			model.addAttribute("user", (Student)object);
    		model.addAttribute("menu", courseMenuService.list());
    		return "/user/order.html";
		}else {
			Student user2 = new Student();
			user2.setUsername("游客");
			user2.setUserId(-1);
			model.addAttribute("user", user2);
			model.addAttribute("menu", courseMenuService.list());
			return "default/login.html";
		}
	}
	
	@RequestMapping("/notice")
	public String notice(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
		if(object != null) {
			model.addAttribute("user", (Student)object);
    		model.addAttribute("menu", courseMenuService.list());
    		return "/user/notice.html";
		}else {
			Student user2 = new Student();
			user2.setUsername("游客");
			user2.setUserId(-1);
			model.addAttribute("user", user2);
			model.addAttribute("menu", courseMenuService.list());
			return "default/login.html";
		}
	}
	
	
	@RequestMapping("/release")
	public String release(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
		if(object != null) {
			model.addAttribute("user", (Student)object);
    		model.addAttribute("menu", courseMenuService.list());
    		return "/user/release.html";
		}else {
			Student user2 = new Student();
			user2.setUsername("游客");
			user2.setUserId(-1);
			model.addAttribute("user", user2);
			model.addAttribute("menu", courseMenuService.list());
			return "default/login.html";
		}
	}
	

}
