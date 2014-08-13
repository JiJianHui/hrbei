package com.hrbei.rep.category.entity;

import com.hrbei.rep.AbstractPersistence;
import com.hrbei.rep.product.entity.Product;

import javax.persistence.*;
import java.util.List;

/**
 * 该类里面保存了产品的类别信息，每个产品的类别都属于一个类。
 * 同时该类别还为新闻类别提供帮助。
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-25 23:33
 * Email: jhji@ir.hit.edu.cn
 */
@Entity
public class Category extends AbstractPersistence
{
    private String name;    //类别名称
    private Integer subjectNum;  //属于这个类别的商品的数目

    @Column(columnDefinition = "longtext")
    private String description; //类别简介

    @OneToOne
    private Category parentCategory;

    private Boolean isDeleted = false;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSubjectNum() {
        return subjectNum;
    }

    public void setSubjectNum(Integer subjectNum) {
        this.subjectNum = subjectNum;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public Category getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(Category parentCategory) {
        this.parentCategory = parentCategory;
    }
}
