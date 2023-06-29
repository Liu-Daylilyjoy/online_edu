package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.controller.PageParam;
import com.hubu.online.entity.Classify;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Mapper接口
 */
public interface ClassifyMapper extends BaseMapper<Classify> {

    /**
     * 分页查询
     */
    List<Classify> listPage(@Param("page") PageParam<Classify> page);

    /**
     * 查询全部
     */
    List<Classify> listAll(@Param("page") Map<String, Object> page);

}
