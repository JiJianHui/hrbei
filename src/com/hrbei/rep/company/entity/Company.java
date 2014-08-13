package com.hrbei.rep.company.entity;

import com.hrbei.rep.AbstractPersistence;
import com.hrbei.rep.product.entity.Product;
import com.hrbei.rep.user.entity.User;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-25 23:33
 * Email: jhji@ir.hit.edu.cn
 */
@Entity
public class Company extends AbstractPersistence
{
    private String name;    //企业名称
    private String nickName;    //企业登录昵称
    private String logo;        //企业小型Logo
    private String homeImage;   //企业个人主页图片展示
    private String address;
    private String qq;
    private String phone;
    private String mobilePhone;

    @ManyToOne
    private User responsiblePerson;  //负责人，必须要负责人才能管理
    private String description; //企业简介

    private Boolean isDeleted = false;
    private Integer status;    //该商家所处的状态，比如：审核中，运行中，关门停业

    @OneToMany(mappedBy = "company")
    @OrderBy("date asc")
    private List<Product> products;  //本公司的产品

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getHomeImage() {
        return homeImage;
    }

    public void setHomeImage(String homeImage) {
        this.homeImage = homeImage;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public User getResponsiblePerson() {
        return responsiblePerson;
    }

    public void setResponsiblePerson(User responsiblePerson) {
        this.responsiblePerson = responsiblePerson;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
