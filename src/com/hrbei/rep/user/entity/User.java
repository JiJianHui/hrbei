package com.hrbei.rep.user.entity;

import com.hrbei.common.Constants;
import com.hrbei.rep.AbstractPersistence;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.util.Calendar;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-25 23:33
 * Email: jhji@ir.hit.edu.cn
 */
@Entity
public class User extends AbstractPersistence
{
    private String nickName;
    private String email;   //登陆邮箱
    private String password;    //登陆密码
    private String logo = Constants.User_Default_Portrait;        //个人头像

    private Boolean sexy = true;    //默认性别,true为男
    private String mobilePhone; //移动电话
    private Calendar birthday;  //生日
    private String address;    //地址
    @Column(columnDefinition = "longtext")
    private String description; //用户简介

    private Integer userRoleType = Constants.User_RoleType_Normal;   //用户权限,默认是0正常用户
    private Boolean isDeleted = false;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String name) {
        this.nickName = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Boolean getSexy() {
        return sexy;
    }

    public void setSexy(Boolean sexy) {
        this.sexy = sexy;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public Calendar getBirthday() {
        return birthday;
    }

    public void setBirthday(Calendar birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getUserRoleType() {
        return userRoleType;
    }

    public void setUserRoleType(Integer userRoleType) {
        this.userRoleType = userRoleType;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
}
