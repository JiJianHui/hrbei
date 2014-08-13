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
    private String name;    //��ҵ����
    private String nickName;    //��ҵ��¼�ǳ�
    private String logo;        //��ҵС��Logo
    private String homeImage;   //��ҵ������ҳͼƬչʾ
    private String address;
    private String qq;
    private String phone;
    private String mobilePhone;

    @ManyToOne
    private User responsiblePerson;  //�����ˣ�����Ҫ�����˲��ܹ���
    private String description; //��ҵ���

    private Boolean isDeleted = false;
    private Integer status;    //���̼�������״̬�����磺����У������У�����ͣҵ

    @OneToMany(mappedBy = "company")
    @OrderBy("date asc")
    private List<Product> products;  //����˾�Ĳ�Ʒ

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
