package com.hubu.online.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author 刘东阳
 * @date 2023/6/28 16:34
 */
@Data
@TableName("edu_question")
@ToString
public class Question implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "question_id", type = IdType.AUTO)
    private Integer questionId;

    private String examId;

    private String content;

    private String solution;

    private Integer score;

    @Override
    public String toString() {
        return "Question{" +
                ", questionId=" + questionId +
                ", examId=" + examId +
                ", content=" + content +
                ", solution=" + solution +
                ", score=" + score +
                "}";
    }
}