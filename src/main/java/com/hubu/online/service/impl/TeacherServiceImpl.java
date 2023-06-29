package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.controller.PageParam;
import com.hubu.online.controller.PageResult;
import com.hubu.online.mapper.TeacherMapper;
import com.hubu.online.entity.Teacher;
import com.hubu.online.service.TeacherService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 服务实现类
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Override
    public PageResult<Teacher> listPage(PageParam<Teacher> page) {
        List<Teacher> records = baseMapper.listPage(page);
        return new PageResult<>(records, page.getTotal());
    }

    @Override
    public List<Teacher> listAll(Map<String, Object> page) {
        return baseMapper.listAll(page);
    }

}
