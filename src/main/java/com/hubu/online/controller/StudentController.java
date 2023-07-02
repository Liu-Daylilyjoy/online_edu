package com.hubu.online.controller;

import com.alibaba.fastjson.JSON;
import com.hubu.online.entity.*;
import com.hubu.online.service.StudentService;
import com.hubu.online.utils.CoreUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hubu.online.service.CourseMenuService;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/users")
public class StudentController extends BaseController{
	
	@Autowired
	private CourseMenuService courseMenuService;

	@Autowired
	private StudentService studentService;

	@RequestMapping("/student")
	public String view() {
		return "system/student.html";
	}

	/**
	 * 添加
	 */
	@ResponseBody
	@RequestMapping("student/save")
	public JsonResult saveit(Student student) {
		student.setPassword(studentService.encodePsw(student.getPassword()));
		if (studentService.save(student)) {
			return JsonResult.ok("添加成功");
		}
		return JsonResult.error("添加失败");
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("student/update")
	public JsonResult updateit(Student student) {
		if (studentService.updateById(student)) {
			return JsonResult.ok("修改成功");
		}
		return JsonResult.error("修改失败");
	}


	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping("/remove")
	public JsonResult remove(Integer id) {
		if (studentService.removeById(id)) {
			return JsonResult.ok("删除成功");
		}
		return JsonResult.error("删除失败");
	}

	/**
	 * 批量删除用户
	 */
	@ResponseBody
	@RequestMapping("/removeBatch")
	public JsonResult deleteBatch(@RequestBody List<Integer> ids) {
		if (studentService.removeByIds(ids)) {
			return JsonResult.ok("删除成功");
		}
		return JsonResult.error("删除失败");
	}

	/**
	 * 重置密码
	 */
	@ResponseBody
	@RequestMapping("/psw/reset")
	public JsonResult resetPsw(Integer id, String password) {
		Student student = new Student();
		student.setUserId(id);
		student.setPassword(studentService.encodePsw(password));
		if (studentService.updateById(student)) {
			return JsonResult.ok("重置成功");
		} else {
			return JsonResult.error("重置失败");
		}
	}

	/**
	 * 分页查询用户
	 */
//    @RequiresPermissions("sys:user:list")
	@ResponseBody
	@RequestMapping("/page")
	public PageResult<Student> page(HttpServletRequest request) {
		PageParam<Student> pageParam = new PageParam<>(request);
		pageParam.setDefaultOrder(null, new String[]{"create_time"});
		return studentService.listPage(pageParam);
	}


	/**
	 * 前台修改用户个人信息
	 */
	@ResponseBody
	@RequestMapping("/update")
	public JsonResult update(@RequestBody Student student) {

		Subject subject = SecurityUtils.getSubject();
		Object object = subject.getPrincipal();
		Student loginstu = (Student)object;
		student.setUserId(loginstu.getUserId());
		System.out.println(student);
		System.out.println("成功返回后端");
		if (studentService.updateStudent(student)) {
			return JsonResult.ok("修改成功");
		}
		return JsonResult.error("修改失败");
	}

	//前台修改密码
	@ResponseBody
	@RequestMapping("/update2")
	public JsonResult update2(HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		Object object = subject.getPrincipal();
		Student loginstu = (Student)object;
		//接受数据
		String password = request.getParameter("password");
		String pass = request.getParameter("pass");
//		System.out.println(password);
//		System.out.println(pass);
		System.out.println("成功返回后端");
		//md5加密
		String md5pwd= CoreUtil.encode(password);
		System.out.println(md5pwd);
		//获取数据库中密码
		Student student = new Student();
		Integer flag = loginstu.getUserId();
		if(flag>0){
			student.setUserId(loginstu.getUserId());
			Student getstudent = studentService.getById(student);
//		System.out.println(getstudent);
			if(getstudent.getPassword().equalsIgnoreCase(md5pwd)){
				pass= CoreUtil.encode(pass);
				student.setPassword(pass);
				studentService.updateById(student);
				return JsonResult.error("修改成功");
			}else{
				return JsonResult.error("原密码错误");
			}
		}
		return JsonResult.error("获取ID错误");

	}

	//注册
	@RequestMapping("/regester")
	public String regester(Model model) {
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
			return "default/regester.html";
		}
	}

	@ResponseBody
	@PostMapping("/save")
	public JsonResult save(@RequestBody Student student) {
		student.setState(0);
		student.setPassword(studentService.encodePsw(student.getPassword()));
		if (studentService.saveStudent(student)) {
			return JsonResult.ok("添加成功");
		}
		return JsonResult.error("添加失败");
	}
	
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
