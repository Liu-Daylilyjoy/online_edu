package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;
import java.io.Serializable;

@Data
@TableName("edu_course")
public class Course implements Serializable {
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
     * 缩略图
     */
    private String imageUrl;

    /**
     * 类别
     */
    private String type;

    /**
     * 内容
     */
    private String content;

    /**
     * 教师id
     */
    private Integer teacherId;


    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 分类id
     */
    private Integer classifyId;

    private Integer ggkc;
    
    private Integer zykc;
    
    private Integer mfkc;

    @Override
    public String toString() {
        return "Course{" +
        ", id=" + id +
        ", name=" + name +
        ", imageUrl=" + imageUrl +
        ", type=" + type +
        ", content=" + content +
        ", teacherId=" + teacherId +
        ", createTime=" + createTime +
        ", classifyId=" + classifyId +
        ", ggkc=" + ggkc +
        ", zykc=" + zykc +
        ", mfkc=" + mfkc +
        "}";
    }

}
