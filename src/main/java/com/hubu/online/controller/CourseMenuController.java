package com.hubu.online.controller;

import com.hubu.online.entity.BatchParam;
import com.hubu.online.entity.CourseMenu;
import com.hubu.online.service.CourseMenuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 管理
 */
@Controller
@RequestMapping("/course/menu")
public class CourseMenuController extends BaseController {
    @Autowired
    private CourseMenuService courseMenuService;

    @RequestMapping()
    public String view() {
        return "course/menu.html";
    }

    /**
     * 分页查询
     */
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<CourseMenu> page(HttpServletRequest request) {
        PageParam<CourseMenu> pageParam = new PageParam<>(request);
        return new PageResult<>(courseMenuService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
    }

    /**
     * 查询全部
     */
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        PageParam<CourseMenu> pageParam = new PageParam<>(request);
        return JsonResult.ok().setData(courseMenuService.list(pageParam.getOrderWrapper()));
    }

    /**
     * 根据id查询
     */
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(courseMenuService.getById(id));
    }

    /**
     * 添加
     */
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(CourseMenu menu) {
        if (courseMenuService.save(menu)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(CourseMenu menu) {
        if (courseMenuService.updateById(menu)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (courseMenuService.removeById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量添加
     */
    @ResponseBody
    @RequestMapping("/saveBatch")
    public JsonResult saveBatch(@RequestBody List<CourseMenu> list) {
        if (courseMenuService.saveBatch(list)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 批量修改
     */
    @ResponseBody
    @RequestMapping("/updateBatch")
    public JsonResult updateBatch(@RequestBody BatchParam<CourseMenu> batchParam) {
        if (batchParam.update(courseMenuService, "id")) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量删除
     */
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Integer> ids) {
        if (courseMenuService.removeByIds(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

}
