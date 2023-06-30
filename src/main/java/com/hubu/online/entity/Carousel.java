package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("edu_carousel")
public class Carousel implements Serializable {
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

    @Override
    public String toString() {
        return "Lunbo{" +
        ", id=" + id +
        ", name=" + name +
        ", sort=" + sort +
        ", url=" + url +
        "}";
    }

}
