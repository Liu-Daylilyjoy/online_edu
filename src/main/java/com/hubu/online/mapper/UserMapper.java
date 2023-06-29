package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.controller.PageParam;
import com.hubu.online.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户Mapper接口
 */
public interface UserMapper extends BaseMapper<User> {


    /**
     * 分页查询
     */
    List<User> listPage(@Param("page") PageParam<User> page);

    /**
     * 查询全部
     */
    List<User> listAll(@Param("page") Map<String, Object> page);

}
