package com.hrbei.rep.company.entity;

import com.hrbei.common.Constants;
import com.hrbei.rep.AbstractPersistence;
import com.hrbei.rep.category.entity.Category;
import com.hrbei.rep.product.entity.Product;
import com.hrbei.rep.user.entity.User;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
    private String logo = Constants.Company_Default_Portrait;        //企业小型Logo
    private String homeImage = Constants.Company_Default_Image;   //企业个人主页图片展示
    private String adImage = Constants.Company_Default_Image;
    private String address = Constants.Company_Default_Image;
    private String qq;
    private String phone;
    private String mobilePhone;

    @ManyToOne
    private User responsiblePerson;  //负责人，必须要负责人才能创建和管理
    @Column(columnDefinition = "longtext")
    private String description; //企业简介

    private String contactName;    //联系人，是该公司的联系人

    private Boolean isDeleted = false;
    private Integer status = Constants.Company_Status_Review;    //该商家所处的状态，比如：审核中，运行中，关门停业

    private String email;
    //    private String homeBackgroundColor;
    private String webSite;

    @OneToMany(mappedBy = "company")
    private List<Product> products;  //本公司的产品

    @OneToMany
    private List<Category> categorys;


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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contacts) {
        this.contactName = contacts;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdImage() {
        return adImage;
    }

    public void setAdImage(String adImage) {
        this.adImage = adImage;
    }
}
