package com.hrbei.action.admin;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.company.dao.CompanyDao;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.user.dao.UserDao;
import com.hrbei.rep.user.entity.User;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-25 16:50
 * Email: jhji@ir.hit.edu.cn
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class AdminAction extends BasicAction {

    private User user;
    private UserDao userDao;

    private Company company;
    private CompanyDao companyDao;
    private List<Company> companies;

    private Pagination pagination = new Pagination();

    private String resultMessage;

    @Action(value = "initAdminManageCompany",
            results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initAdminManageCompany"),
                       @Result(name = ERROR,type = Constants.RESULT_NAME_TILES, location = ".noPermission")})
    public String manageCompanyInReview(){

        if( this.getSessionUserId() == null ) return ERROR;

        user = userDao.findById(this.getSessionUserId());

        if( !this.isAdmin(user) ) return ERROR;

        companies = companyDao.findAllCompanyInStatus(Constants.Company_Status_Review, pagination);

        return SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public CompanyDao getCompanyDao() {
        return companyDao;
    }

    public void setCompanyDao(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    public List<Company> getCompanies() {
        return companies;
    }

    public void setCompanies(List<Company> companies) {
        this.companies = companies;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }
}
