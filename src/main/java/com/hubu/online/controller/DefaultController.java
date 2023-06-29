package com.hubu.online.controller;

import javax.servlet.http.HttpServletRequest;

import com.hubu.online.entity.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hubu.online.shiro.CustomizedToken;
import com.hubu.online.utils.FileUploadUtil;
import com.hubu.online.service.StudentService;
import com.hubu.online.service.ClassifyService;
import com.hubu.online.service.CourseService;
import com.hubu.online.service.CarouselService;
import com.hubu.online.service.CourseMenuService;
import com.hubu.online.service.TeacherService;
import com.hubu.online.service.VideoService;

@Controller
@RequestMapping("/default")
public class DefaultController {
	
	@Autowired
	private CourseMenuService courseMenuService;
	@Autowired
	private CarouselService carouselService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private ClassifyService classifyService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private StudentService usertwoService;
	
	@RequestMapping("/default")
    public String index(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
        }
		model.addAttribute("menu", courseMenuService.list());
		model.addAttribute("lunbo", carouselService.list());
		model.addAttribute("ggkc", courseService.listGgkc());
		model.addAttribute("zykc", courseService.listZykc());
		model.addAttribute("mfkc", courseService.listMfkc());
        return "default/default.html";
    }
	
	@RequestMapping("/course")
    public String course(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
        }
		model.addAttribute("menu", courseMenuService.list());
		model.addAttribute("classify", classifyService.list());
        return "default/course.html";
    }
	
	@RequestMapping("/present")
    public String present(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
        }
		model.addAttribute("menu", courseMenuService.list());
		model.addAttribute("lunbo", carouselService.list());
        return "default/present.html";
    }
	
    @ResponseBody
    @PostMapping("/upload")
    public JsonResult upload(@RequestParam MultipartFile file) {
        return FileUploadUtil.upload(file);
    }
    
    @ResponseBody
    @PostMapping("/edit_upload")
    public JsonResult edit_upload(@RequestParam MultipartFile file) {
        return FileUploadUtil.edit_upload(file);
    }
	
	@RequestMapping("/detail/{id}/")
	public String detail(@PathVariable("id") Integer id,Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
        }else {
        	model.addAttribute("order",null);
        }
		Course course = courseService.getById(id);
		Teacher teacher = teacherService.getById(course.getTeacherId());
		Classify classify = classifyService.getById(course.getClassifyId());
		model.addAttribute("course", course);
		model.addAttribute("teacher", teacher);
		model.addAttribute("classify", classify);
		model.addAttribute("videos", videoService.list(new QueryWrapper<Video>().eq("course_id", course.getId())));
		model.addAttribute("menu", courseMenuService.list());
		model.addAttribute("tuijian", courseService.listXie());
		return "default/detail.html";
	}
	
	@RequestMapping("/pay/{id}/")
	public String pay(@PathVariable("id") Integer id,Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
        }
		Course course = courseService.getById(id);
		model.addAttribute("course", course);
		model.addAttribute("menu", courseMenuService.list());
		return "default/pay.html";
	}
	
	@RequestMapping("/release")
	public String release(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
        }
		model.addAttribute("menu", courseMenuService.list());
		return "default/release.html";
	}
	
	@RequestMapping("/releases")
	public String releases(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (Student)object);
        }
		model.addAttribute("menu", courseMenuService.list());
		model.addAttribute("lunbo", carouselService.list());
		return "default/releases.html";
	}
	
	/**
     * 分页查询
     */
    @ResponseBody
    @RequestMapping("/course/page")
    public PageResult<Course> page(HttpServletRequest request) {
        PageParam<Course> pageParam = new PageParam<>(request);
        return new PageResult<>(courseService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
    }
    
    /**
     * 登录
     */
	@RequestMapping("/login")
    public String login(Model model) {
		
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if (object != null) {
        	model.addAttribute("menu", courseMenuService.list());
        	model.addAttribute("user", (Student)object);
        	return "redirect:/users/index";
        }else {
        	Student user2 = new Student();
			user2.setUsername("游客");
			user2.setUserId(-1);
			model.addAttribute("user", user2);
			model.addAttribute("menu", courseMenuService.list());
			return "default/login.html";
		}
		
        
    }

	/**
     * 用户登录
     */
    @ResponseBody
    @PostMapping("/tologin")
    public JsonResult tologin(String username, String password, String code, Boolean remember, HttpServletRequest request) {
        if (username == null || username.trim().isEmpty()) {
			return JsonResult.error("请输入账号");
		}
		//验证码
//        if (!CaptchaUtil.ver(code, request)) {
//            return JsonResult.error("验证码不正确");
//        }
        try {
            if (remember == null) {
				remember = false;
			}
            SecurityUtils.getSubject().login(new CustomizedToken(username, password, remember,"User"));
            return JsonResult.ok("登录成功").put("action", "/users/index").put("status", 0);
        } catch (IncorrectCredentialsException ice) {
            return JsonResult.error("密码错误");
        } catch (UnknownAccountException uae) {
            return JsonResult.error("账号不存在");
        } catch (LockedAccountException e) {
            return JsonResult.error("账号被锁定");
        } catch (ExcessiveAttemptsException eae) {
            return JsonResult.error("操作频繁，请稍后再试");
        }
    }
    
    @RequestMapping(value = "/logout")
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/default/login";
    }
}
