package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色
 */
@Data
@TableName("edu_role")
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 角色id
     */
    @TableId(value = "role_id", type = IdType.AUTO)
    private Integer roleId;
    /**
     * 角色名称
     */
    private String roleName;
    /**
     * 角色标识
     */
    private String roleCode;
    /**
     * 备注
     */
    private String comments;
    /**
     * 创建时间
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
     * 用户id
     */
    @TableField(exist = false)
    private Integer userId;

    public Role() {
    }

    public Role(Integer roleId, String roleName) {
        this(roleId, roleName, null);
    }

    public Role(Integer roleId, String roleName, String comments) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Role{" +
                ", roleId=" + roleId +
                ", roleName=" + roleName +
                ", comments=" + comments +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", deleted=" + deleted +
                ", userId=" + userId +
                "}";
    }
}
