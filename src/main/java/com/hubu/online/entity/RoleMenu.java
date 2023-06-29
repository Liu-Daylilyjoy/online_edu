package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色权限
 */
@Data
@TableName("edu_role_menu")
public class RoleMenu implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 角色id
     */
    private Integer roleId;
    /**
     * 菜单id
     */
    private Integer menuId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;

    @Override
    public String toString() {
        return "RoleAuthorities{" +
                ", id=" + id +
                ", roleId=" + roleId +
                ", menuId=" + menuId +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }

}
