package com.hubu.online.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hubu.online.controller.PageParam;
import com.hubu.online.controller.PageResult;
import com.hubu.online.entity.Classify;

import java.util.List;
import java.util.Map;

/**
 * 服务类
 */
public interface ClassifyService extends IService<Classify> {

    /**
     * 分页查询
     */
    PageResult<Classify> listPage(PageParam<Classify> page);

    /**
     * 查询所有
     */
    List<Classify> listAll(Map<String, Object> page);

}
