package com.hubu.online.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.PageResult;
import com.hubu.online.entity.Teacher;

import java.util.List;
import java.util.Map;

/**
 * 服务类
 */
public interface TeacherService extends IService<Teacher> {

    /**
     * 分页查询
     */
    PageResult<Teacher> listPage(PageParam<Teacher> page);

    /**
     * 查询所有
     */
    List<Teacher> listAll(Map<String, Object> page);

}
