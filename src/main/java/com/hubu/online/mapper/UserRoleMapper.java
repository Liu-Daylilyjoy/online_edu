package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.entity.Role;
import com.hubu.online.entity.UserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户角色Mapper接口
 */

@Repository
public interface UserRoleMapper extends BaseMapper<UserRole> {

    /**
     * 批量添加用户角色
     */
    int insertBatch(@Param("userId") Integer userId, @Param("roleIds") List<Integer> roleIds);

    /**
     * 批量查询用户角色
     */
    List<Role> listByUserIds(@Param("userIds") List<Integer> userIds);

    /**
     * 查询某个用户的角色
     */
    List<Role> listByUserId(@Param("userId") Integer userId);

}
