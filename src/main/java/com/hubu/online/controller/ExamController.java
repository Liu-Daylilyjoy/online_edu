package com.hubu.online.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hubu.online.entity.*;
import com.hubu.online.service.ExamService;
import com.hubu.online.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 刘东阳
 * @date 2023/6/28 16:10
 */
@Controller
@RequestMapping("/exam/exam")
@Transactional
public class ExamController extends BaseController {
    @Autowired
    ExamService examService;

    @Autowired
    QuestionService questionService;
    
    @RequestMapping()
    public String view(Model model) {
        model.addAttribute("examList", examService.list());
        return "exam/exam.html";
    }

    @RequestMapping("/publish")
    public String publish() {
        return "exam/publish.html";
    }

    @RequestMapping("/submitList")
    public String submit() {
        return "exam/submit_list.html";
    }

    /**
     * 分页查询
     */
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<Exam> page(HttpServletRequest request) {
        PageParam<Exam> pageParam = new PageParam<>(request);
        return new PageResult<>(examService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
    }

    /**
     * 查询全部
     */
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        PageParam<Exam> pageParam = new PageParam<>(request);
        return JsonResult.ok().setData(examService.list(pageParam.getOrderWrapper()));
    }

    /**
     * 根据id查询
     */
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(examService.getById(id));
    }

    /**
     * 添加
     */
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(@RequestBody Map data) {
        Exam exam = new Exam();
        exam.setExamId((String) data.get("examId"));
        exam.setExamName((String) data.get("examName"));
        exam.setExamDesc((String) data.get("examDesc"));
        List<Map> questions = (ArrayList) data.get("question");
        List<Question> questionList = new ArrayList<>();
        for (Map question : questions) {
            Question temp = new Question();
            temp.setContent((String) question.get("content"));
            temp.setScore((Integer) question.get("score"));
            temp.setSolution((String) question.get("solution"));
            temp.setExamId(exam.getExamId());
            questionList.add(temp);
        }

        if (examService.save(exam) && questionService.saveBatch(questionList)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Exam exam) {
        if (examService.updateById(exam)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(String id) {
        examService.removeById(id);
        questionService.deleteByExamId(id);

        return JsonResult.ok("删除成功");
    }

    /**
     * 批量添加
     */
    @ResponseBody
    @RequestMapping("/saveBatch")
    public JsonResult saveBatch(@RequestBody List<Exam> list) {
        System.out.println(list);

        if (examService.saveBatch(list)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 批量修改
     */
    @ResponseBody
    @RequestMapping("/updateBatch")
    public JsonResult updateBatch(@RequestBody BatchParam<Exam> batchParam) {
        if (batchParam.update(examService, "id")) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量删除
     */
    @Transactional
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<String> ids) {
        for (String examId : ids) {
            examService.removeByIds(ids);
            questionService.deleteByExamId(examId);
        }

        return JsonResult.ok("删除成功");
    }
}