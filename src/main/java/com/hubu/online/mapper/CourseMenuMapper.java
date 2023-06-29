package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.CourseMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Mapper接口
 */
public interface CourseMenuMapper extends BaseMapper<CourseMenu> {

    /**
     * 分页查询
     */
    List<CourseMenu> listPage(@Param("page") PageParam<CourseMenu> page);

    /**
     * 查询全部
     */
    List<CourseMenu> listAll(@Param("page") Map<String, Object> page);

}
