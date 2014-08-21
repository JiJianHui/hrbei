package com.hrbei.action.company;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.rep.company.dao.CompanyDao;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.user.dao.UserDao;
import com.hrbei.rep.user.entity.User;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-14 21:23
 * Email: jhji@ir.hit.edu.cn
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class CompanyAction extends BasicAction{

    private User user;
    private UserDao userDao;
    private Company company;
    private CompanyDao companyDao;

    @Action(value = "initCreateCompany", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initCreateCompany")})
    public String initCreateCompany()
    {
        user = userDao.findById(this.getSessionUserId());
        if( company == null ) company = new Company();
        return SUCCESS;
    }

    @Action(value = "saveCompany", results={@Result(name=SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myCompany"})})
    public String ajaxSaveCompanyLogo()
    {
        user = userDao.findById(this.getSessionUserId());
        companyDao.persist(company);
        company.setResponsiblePerson(user);
        companyDao.persist(company);

        //TODO 将图片拷贝到对应的公司文件夹目录下

        return SUCCESS;
    }


    @Action(value = "initUpdateCompany", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initUpdateCompany")})
    public String initUpdateCompany()
    {
        user = userDao.findById(this.getSessionUserId());
        company = companyDao.findById( this.getCompany().getId() );
        return SUCCESS;
    }

    @Action(value = "updateCompanyInfo", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myCompany"})})
    public String updateCompanyInfo()
    {
        Company oldCompany = companyDao.findById(this.getCompany().getId());
        oldCompany.setName( company.getName() );
        oldCompany.setAddress( company.getAddress() );
        oldCompany.setDescription( company.getDescription() );
        oldCompany.setContactName( company.getContactName() );
        oldCompany.setQq( company.getQq() );
        oldCompany.setPhone( company.getPhone() );
        oldCompany.setMobilePhone( company.getMobilePhone() );
        oldCompany.setEmail( company.getEmail() );
        oldCompany.setWebSite( company.getWebSite() );
        oldCompany.setLogo( company.getLogo() );
        oldCompany.setHomeImage( company.getHomeImage() );
        oldCompany.setAdImage( company.getAdImage() );

        //TODO 将图片拷贝到对应的公司文件夹目录下

        companyDao.persistAbstract(oldCompany);

        return SUCCESS;
    }

    @Action(value = "initAddProduct", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initAddProduct")})
    public String initAddProduct()
    {
        company = companyDao.findById(this.getCompany().getId());
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
}
