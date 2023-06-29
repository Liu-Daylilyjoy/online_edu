package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.controller.PageParam;
import com.hubu.online.controller.PageResult;
import com.hubu.online.mapper.CourseMapper;
import com.hubu.online.entity.Course;
import com.hubu.online.service.CourseService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements CourseService {

    @Override
    public PageResult<Course> listPage(PageParam<Course> page) {
        List<Course> records = baseMapper.listPage(page);
        return new PageResult<>(records, page.getTotal());
    }

    @Override
    public List<Course> listAll(Map<String, Object> page) {
        return baseMapper.listAll(page);
    }

	@Override
	public List<Course> listGgkc() {
		return baseMapper.listGgkc();
	}

	@Override
	public List<Course> listZykc() {
		return baseMapper.listZykc();
	}

	@Override
	public List<Course> listMfkc() {
		return baseMapper.listMfkc();
	}

	@Override
	public List<Course> listXie() {
		return baseMapper.listXie();
	}

}
