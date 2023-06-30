package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @author 刘东阳
 * @date 2023/6/28 16:14
 */
@Data
@TableName("edu_exam")
public class Exam implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "exam_id")
    private String examId;

    private String examName;

    private String examDesc;

    @Override
    public String toString() {
        return "Exam{" +
                ", examId=" + examId +
                ", examName=" + examName +
                ", examDesc=" + examDesc +
                "}";
    }
}