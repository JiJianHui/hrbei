package com.hrbei.rep.news.entity;

import com.hrbei.rep.AbstractPersistence;
import com.hrbei.rep.category.entity.Category;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.user.entity.User;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.Calendar;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-25 23:33
 * Email: jhji@ir.hit.edu.cn
 */
@Entity
public class News extends AbstractPersistence
{
    private String title;   //标题
    private String author;  //作者
    private Calendar pubTime;   //发布时间
    private String pubOrg;  //发布机构

    @Column(columnDefinition = "longtext")
    private String content;

    @OneToMany
    private List<Category> categorys;  //新闻类别

    @ManyToOne
    private User pubUser;  //注意，根据不同的用户类型去不同的表中查询。
    @ManyToOne
    private Company company;

    private Integer pubUserType; //发布者类型，默认0为公司，1为普通用户

    private Boolean isDeleted = false;  //是否删除

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Calendar getPubTime() {
        return pubTime;
    }

    public void setPubTime(Calendar pubTime) {
        this.pubTime = pubTime;
    }

    public String getPubOrg() {
        return pubOrg;
    }

    public void setPubOrg(String pubOrg) {
        this.pubOrg = pubOrg;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public User getPubUser() {
        return pubUser;
    }

    public void setPubUser(User pubUser) {
        this.pubUser = pubUser;
    }

    public Integer getPubUserType() {
        return pubUserType;
    }

    public void setPubUserType(Integer pubUserType) {
        this.pubUserType = pubUserType;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}
