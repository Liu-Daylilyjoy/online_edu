package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Mapper接口
 */
public interface TeacherMapper extends BaseMapper<Teacher> {

    /**
     * 分页查询
     */
    List<Teacher> listPage(@Param("page") PageParam<Teacher> page);

    /**
     * 查询全部
     */
    List<Teacher> listAll(@Param("page") Map<String, Object> page);

}
