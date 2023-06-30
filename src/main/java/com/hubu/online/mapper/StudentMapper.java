package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.Student;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

/**
 * 用户Mapper接口
 */
public interface StudentMapper extends BaseMapper<Student> {

    /**
     * 分页查询
     */
    List<Student> listPage(@Param("page") PageParam<Student> page);

    /**
     * 查询全部
     */
    List<Student> listAll(@Param("page") Map<String, Object> page);

}
