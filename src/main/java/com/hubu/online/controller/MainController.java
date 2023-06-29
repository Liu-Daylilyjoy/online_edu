package com.hubu.online.controller;

import com.hubu.online.shiro.CustomizedToken;
import com.hubu.online.entity.Menu;
import com.hubu.online.service.MenuService;
import com.wf.captcha.utils.CaptchaUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 首页、登录、验证码等
 */
@Controller
public class MainController extends BaseController implements ErrorController {
    @Autowired
    private MenuService menuService;

    /**
     * 用户登录
     */
    @ResponseBody
    @PostMapping("/login")
    public JsonResult login(String username, String password, String code, Boolean remember, HttpServletRequest request) {
        if (username == null || username.trim().isEmpty()) {
            return JsonResult.error("请输入账号");
        }
//        if (!CaptchaUtil.ver(code, request)) {
//            return JsonResult.error("验证码不正确");
//        }
        try {
            if (remember == null) {
                remember = false;
            }
            SecurityUtils.getSubject().login(new CustomizedToken(username, password, remember,"Admin"));
            return JsonResult.ok("登录成功");
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

    /**
     * 登录页
     */
    @GetMapping("/login")
    public String login() {
        if (getLoginUser() != null) {
            return "redirect:index";
        }
        return "login.html";
    }

    /**
     * 主页
     */
    @RequestMapping({ "/","/index"})
    public String index(Model model) {
        // 左侧菜单
        List<Menu> menus = menuService.getUserMenu(getLoginUserId(), Menu.TYPE_MENU);
        model.addAttribute("menus", menuService.toMenuTree(menus, 0));
        return "index.html";
    }

    /**
     * 图形验证码
     */
//    @RequestMapping("/assets/captcha")
//    public void captcha(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            CaptchaUtil.out(5, request, response);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    /**
     * 主页弹窗页面
     */
    @RequestMapping("/tpl/{name}")
    public String tpl(@PathVariable("name") String name) {
        return "index/" + name + ".html";
    }

    /**
     * 错误页
     */
    @RequestMapping("/error")
    public String error() {
        return "error/404.html";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }

}
