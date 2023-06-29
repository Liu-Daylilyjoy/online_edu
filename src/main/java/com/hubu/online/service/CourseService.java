package com.hubu.online.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.PageResult;
import com.hubu.online.entity.Course;

import java.util.List;
import java.util.Map;

/**
 * 服务类
 */
public interface CourseService extends IService<Course> {

    /**
     * 分页查询
     */
    PageResult<Course> listPage(PageParam<Course> page);

    /**
     * 查询所有
     */
    List<Course> listAll(Map<String, Object> page);
    
    List<Course> listGgkc();
    
    List<Course> listZykc();
    
    List<Course> listMfkc();
    
    List<Course> listXie();

}
