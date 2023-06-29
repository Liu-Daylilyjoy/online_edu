package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("edu_course_menu")
public class CourseMenu implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 路径
     */
    private String url;
    
    private String icon;


    /**
     * 排序
     */
    private Integer sort;

    @Override
    public String toString() {
        return "Menu{" +
        ", id=" + id +
        ", name=" + name +
        ", url=" + url +
        ", icon=" + icon +
        ", sort=" + sort +
        "}";
    }

}
