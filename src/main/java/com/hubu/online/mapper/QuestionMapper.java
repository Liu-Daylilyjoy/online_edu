package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.entity.Question;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 刘东阳
 * @date 2023/6/28 16:44
 */
@Mapper
public interface QuestionMapper extends BaseMapper<Question> {
}
