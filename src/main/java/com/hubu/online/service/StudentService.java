package com.hubu.online.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hubu.online.controller.PageParam;
import com.hubu.online.controller.PageResult;
import com.hubu.online.entity.Student;
import com.hubu.online.entity.User;

import java.util.List;
import java.util.Map;

/**
 * 用户服务类
 */
public interface StudentService extends IService<Student> {

    /**
     * 添加用户(包含角色)
     */
    boolean saveStudent(Student student);

    /**
     * 修改用户(包含角色)
     */
    boolean updateStudent(Student student);

    /**
     * 根据账号查询用户
     */
	Student getByUsername(String username);


    /**
     * 关联分页查询用户
     */
    PageResult<Student> listPage(PageParam<Student> page);

    /**
     * 关联查询全部用户
     */
    List<Student> listAll(Map<String, Object> page);

  


    /**
     * 比较用户密码
     *
     * @param dbPsw    数据库存储的密码
     * @param inputPsw 用户输入的密码
     * @return boolean
     */
    boolean comparePsw(String dbPsw, String inputPsw);

    /**
     * md5加密用户密码
     */
    String encodePsw(String psw);

}
