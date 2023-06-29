package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.PageResult;
import com.hubu.online.mapper.CourseMenuMapper;
import com.hubu.online.entity.CourseMenu;
import com.hubu.online.service.CourseMenuService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 服务实现类
 */
@Service
public class CourseMenuServiceImpl extends ServiceImpl<CourseMenuMapper, CourseMenu> implements CourseMenuService {

    @Override
    public PageResult<CourseMenu> listPage(PageParam<CourseMenu> page) {
        List<CourseMenu> records = baseMapper.listPage(page);
        return new PageResult<>(records, page.getTotal());
    }

    @Override
    public List<CourseMenu> listAll(Map<String, Object> page) {
        return baseMapper.listAll(page);
    }

}
