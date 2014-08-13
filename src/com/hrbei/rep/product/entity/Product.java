package com.hrbei.rep.product.entity;

import com.hrbei.rep.AbstractPersistence;
import com.hrbei.rep.category.entity.Category;
import com.hrbei.rep.company.entity.Company;

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
public class Product extends AbstractPersistence
{
    @ManyToOne
    private Company company;

    private String name;        //名称
    private String logo;        //图标
    private String xinghao;     //型号
    private String zhibiao;     //指标
    private Integer price;      //市场价格
    private Integer vipPrice;   //会员价格
    private Integer quanty;     //存货量
    private String description; //描述

    private Integer status; //产品的状态，有时候会停止
    private Boolean isDeleted = false;  //是否删除

    @OneToMany(mappedBy = "product")
    private List<Category> categorys;  //产品类别

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

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

    public String getXinghao() {
        return xinghao;
    }

    public void setXinghao(String xinghao) {
        this.xinghao = xinghao;
    }

    public String getZhibiao() {
        return zhibiao;
    }

    public void setZhibiao(String zhibiao) {
        this.zhibiao = zhibiao;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getVipPrice() {
        return vipPrice;
    }

    public void setVipPrice(Integer vipPrice) {
        this.vipPrice = vipPrice;
    }

    public Integer getQuanty() {
        return quanty;
    }

    public void setQuanty(Integer quanty) {
        this.quanty = quanty;
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

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }
}
