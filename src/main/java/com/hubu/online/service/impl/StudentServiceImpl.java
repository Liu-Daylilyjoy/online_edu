package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.PageResult;
import com.hubu.online.exception.BusinessException;
import com.hubu.online.mapper.StudentMapper;
import com.hubu.online.entity.Student;
import com.hubu.online.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import java.util.List;
import java.util.Map;

/**
 * 用户服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {


    @Autowired
    private StudentMapper studentMapper;


    @Transactional
    @Override
    public boolean saveStudent(Student student) {
        if (student.getUsername() != null && baseMapper.selectCount(new QueryWrapper<Student>()
                .eq("username", student.getUsername())) > 0) {
            throw new BusinessException("账号已存在");
        }
        if (student.getPhone() != null && baseMapper.selectCount(new QueryWrapper<Student>()
                .eq("phone", student.getPhone())) > 0) {
            throw new BusinessException("手机号已存在");
        }
        boolean result = baseMapper.insert(student) > 0;
//        if (result && student.getRoleIds() != null) {
//            addUserRoles(student.getUserId(), student.getRoleIds(), false);
//        }
        if(result){
            return result;
        }
        throw new BusinessException("没添加成功");
    }

    @Transactional
    @Override
    public boolean updateStudent(Student student) {
//        if (student.getUsername() != null && baseMapper.selectCount(new QueryWrapper<Student>()
//                .eq("username", student.getUsername())) > 0) {
//            throw new BusinessException("账号已存在");
//        }
//        if (student.getPhone() != null && baseMapper.selectCount(new QueryWrapper<Student>()
//                .eq("phone", student.getPhone())) > 0) {
//            throw new BusinessException("手机号已存在");
//        }
        boolean result = baseMapper.updateById(student) > 0;
//        if (result && user.getRoleIds() != null) {
//            addUserRoles(user.getUserId(), user.getRoleIds(), true);
//        }
        if(result){
            return result;
        }
        throw new BusinessException("没修改成功");
    }

    @Override
    public Student getByUsername(String username) {
        return baseMapper.selectOne(new QueryWrapper<Student>().eq("username", username));
    }

    @Override
    public PageResult<Student> listPage(PageParam<Student> page) {
        List<Student> users = baseMapper.listPage(page);
        return new PageResult<>(users, page.getTotal());
    }

    @Override
    public List<Student> listAll(Map<String, Object> page) {
        List<Student> users = baseMapper.listAll(page);
        return users;
    }

    @Override
    public boolean comparePsw(String dbPsw, String inputPsw) {
        return dbPsw != null && dbPsw.equals(encodePsw(inputPsw));
    }

    @Override
    public String encodePsw(String psw) {
        if (psw == null) return null;
        return DigestUtils.md5DigestAsHex(psw.getBytes());
    }




}
