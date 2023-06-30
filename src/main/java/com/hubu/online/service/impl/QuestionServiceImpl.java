package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.entity.Question;
import com.hubu.online.mapper.QuestionMapper;
import com.hubu.online.service.QuestionService;
import org.springframework.stereotype.Service;

/**
 * @author 刘东阳
 * @date 2023/6/28 16:51
 */
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements QuestionService {
}
