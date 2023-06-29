package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.entity.Exam;
import com.hubu.online.mapper.ExamMapper;
import com.hubu.online.service.ExamService;
import org.springframework.stereotype.Service;

/**
 * @author 刘东阳
 * @date 2023/6/28 16:43
 */
@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements ExamService {
}