package com.hubu.online.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.PageResult;
import com.hubu.online.entity.CourseMenu;

import java.util.List;
import java.util.Map;

/**
 * 服务类
 */
public interface CourseMenuService extends IService<CourseMenu> {

    /**
     * 分页查询
     */
    PageResult<CourseMenu> listPage(PageParam<CourseMenu> page);

    /**
     * 查询所有
     */
    List<CourseMenu> listAll(Map<String, Object> page);

}
