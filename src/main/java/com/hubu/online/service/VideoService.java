package com.hubu.online.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hubu.online.controller.PageParam;
import com.hubu.online.controller.PageResult;
import com.hubu.online.entity.Video;

import java.util.List;
import java.util.Map;

/**
 * 服务类
 */
public interface VideoService extends IService<Video> {

    /**
     * 分页查询
     */
    PageResult<Video> listPage(PageParam<Video> page);

    /**
     * 查询所有
     */
    List<Video> listAll(Map<String, Object> page);

}
