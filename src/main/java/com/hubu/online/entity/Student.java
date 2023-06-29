package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 用户
 */
@Data
@TableName("edu_student")
public class Student implements Serializable {
    private static final long serialVersionUID = 242146703513492331L;
    /**
     * 用户id
     */
    @TableId(value = "user_id", type = IdType.AUTO)
    private Integer userId;
    /**
     * 账号
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 性别
     */
    private Integer sex;
    /**
     * 手机号
     */
    private String phone;

    /**
     * 真实姓名
     */
    private String trueName;
    /**
     * 身份证号
     */
    private String idCard;
    /**
     * 出生日期
     */
    private Date birthday;
    /**
     * 个人简介
     */
    private String introduction;

    /**
     * 状态，0正常，1冻结
     */
    private Integer state;
    /**
     * 注册时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;
    /**
     * 是否删除,0否,1是
     */
    @TableLogic
    private Integer deleted;
    /**
     * 权限列表
     */
    @TableField(exist = false)
    private List<String> authorities;
    /**
     * 角色列表
     */
    @TableField(exist = false)
    private List<Role> roles;
    /**
     * 角色id
     */
    @TableField(exist = false)
    private List<Integer> roleIds;

    @Override
    public String toString() {
        return "User{" +
                ", userId=" + userId +
                ", username=" + username +
                ", password=" + password +
                ", nickName=" + nickName +
                ", avatar=" + avatar +
                ", sex=" + sex +
                ", phone=" + phone +
                ", trueName=" + trueName +
                ", idCard=" + idCard +
                ", birthday=" + birthday +
                ", introduction=" + introduction +
                ", state=" + state +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", deleted=" + deleted +
                "}";
    }

}
