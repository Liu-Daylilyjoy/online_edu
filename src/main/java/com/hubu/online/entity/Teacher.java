package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("edu_teacher")
public class Teacher implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 真实姓名
     */
    @TableField("nickName")
    private String nickName;

    /**
     * 备注
     */
    private String remark;

    /**
     * 图片
     */
    @TableField("imageName")
    private String imageName;
    
    private Integer userId;

    @Override
    public String toString() {
        return "Teacher{" +
        ", id=" + id +
        ", nickName=" + nickName +
        ", remark=" + remark +
        ", imageName=" + imageName +
        ", userId=" + userId +
        "}";
    }

}
