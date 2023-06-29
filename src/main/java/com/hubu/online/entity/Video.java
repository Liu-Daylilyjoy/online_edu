package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("edu_video")
public class Video implements Serializable {
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
     * 名称
     */
    private String url;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 创建时间
     */
    private Date createTime;
    
    private Integer courseId;

    @Override
    public String toString() {
        return "Classify{" +
        ", id=" + id +
        ", name=" + name +
        ", sort=" + sort +
        ", url=" + url +
        ", createTime=" + createTime +
        ", courseId=" + courseId +
        "}";
    }

}
