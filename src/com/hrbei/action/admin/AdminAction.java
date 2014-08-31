package com.hrbei.action.admin;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.common.utils.Utils;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.company.dao.CompanyDao;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.product.dao.ProductDao;
import com.hrbei.rep.product.entity.Product;
import com.hrbei.rep.user.dao.UserDao;
import com.hrbei.rep.user.entity.User;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
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

    private Product product;
    private List<Product> products;
    private ProductDao productDao;

    private Pagination pagination = new Pagination();

    private String resultMessage;

    private List<User> administors;

    private String newAdminEmail;

    private Integer imageIndex;
    private String websiteImages1;
    private String websiteImages2;
    private String websiteImages3;
    private String websiteImages4;
    private String websiteImages5;

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

    @Action(value = "manageCompany",
            results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initAdminManageCompany"),
                    @Result(name = ERROR,type = Constants.RESULT_NAME_TILES, location = ".noPermission")})
    public String manageCompany(){

        if( this.getSessionUserId() == null ) return ERROR;

        user = userDao.findById(this.getSessionUserId());

        if( !this.isAdmin(user) ) return ERROR;

        companies = companyDao.findAllCompany(pagination);

        return SUCCESS;
    }

    @Action(value = "manageProducts",
            results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".manageProducts"),
                    @Result(name = ERROR,type = Constants.RESULT_NAME_TILES, location = ".noPermission")})
    public String manageProducts(){

        if( this.getSessionUserId() == null ) return ERROR;

        user = userDao.findById(this.getSessionUserId());

        if( !this.isAdmin(user) ) return ERROR;

        products = productDao.findAllProducts(pagination);

        return SUCCESS;
    }


    @Action(value = "initAdminManageUser",
            results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initAdminManageUser"),
                    @Result(name = ERROR,type = Constants.RESULT_NAME_TILES, location = ".noPermission")})
    public String initAdminManageUser(){

        if( this.getSessionUserId() == null ) return ERROR;

        user = userDao.findById(this.getSessionUserId());
        administors = userDao.findByUserRoleType(Constants.User_RoleType_Admin, pagination);

        if( !this.isAdmin(user) ) return ERROR;

        return SUCCESS;
    }

    @Action(value = "ajaxAddManageUser")
    public void ajaxChangeCompanyStatus() throws IOException {

        user = userDao.findById(this.getSessionUserId());

        User newAdmin = userDao.findByEmail(newAdminEmail);
        if( newAdmin == null ) resultMessage = "该用户不存在";
        else{
            newAdmin.setUserRoleType(Constants.User_RoleType_Admin);
            userDao.persist(newAdmin);
            resultMessage = "success";
        }

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(resultMessage);
        out.close();
    }

    @Action(value = "ajaxDeleteAdminUser")
    public void ajaxDeleteAdminUser() throws IOException {

        user = userDao.findById(this.getSessionUserId());

        User oldAdmin = userDao.findByEmail(newAdminEmail);
        if( oldAdmin == null ) resultMessage = "该用户不存在";
        else{
            oldAdmin.setUserRoleType(Constants.User_RoleType_Normal);
            userDao.persist(oldAdmin);
            resultMessage = "success";
        }

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(resultMessage);
        out.close();
    }


    @Action(value = "manageWebsite",
            results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".manageWebsite"),
                    @Result(name = ERROR,type = Constants.RESULT_NAME_TILES, location = ".noPermission")})
    public String manageWebSite(){

        if( this.getSessionUserId() == null ) return ERROR;

        user = userDao.findById(this.getSessionUserId());

        websiteImages1 = Constants.Image_Websit_Dir + File.separator + "1.jpg";
        websiteImages2 = Constants.Image_Websit_Dir + File.separator + "2.jpg";
        websiteImages3 = Constants.Image_Websit_Dir + File.separator + "3.jpg";
        websiteImages4 = Constants.Image_Websit_Dir + File.separator + "4.jpg";
        websiteImages5 = Constants.Image_Websit_Dir + File.separator + "5.jpg";

        if( !this.isAdmin(user) ) return ERROR;


        return SUCCESS;
    }

    @Action(value = "websiteImgCrop", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".websiteImgCrop")})
    public String websiteImgCrop(){
        return SUCCESS;
    }

    @Action(value = "updateWebsiteImages")
    public void updateWebsiteImages() throws IOException {

        user = userDao.findById(this.getSessionUserId());
        String websiteImagepath = ServletActionContext.getServletContext().getRealPath(Constants.Image_Websit_Dir);

        File websiteImageDir = new File(websiteImagepath);
        if (!websiteImageDir.exists()) websiteImageDir.mkdirs();

        // copy jpg
        if (StringUtils.isNotBlank(websiteImages1) && !websiteImages1.startsWith("/images")) {

            Utils.notReplaceFileFromTmpModified(websiteImageDir.getAbsolutePath(), websiteImages1);
            File temp = new File(websiteImageDir + File.separator + websiteImages1);

            String dstPath = websiteImagepath + File.separator + "1.jpg";
            File oldImage = new File(dstPath);

            if( oldImage.exists() ) oldImage.delete();
            temp.renameTo(new File(dstPath) );
        }
        if (StringUtils.isNotBlank(websiteImages2) && !websiteImages2.startsWith("/images") ) {

            Utils.notReplaceFileFromTmpModified(websiteImageDir.getAbsolutePath(), websiteImages2);
            File temp = new File(websiteImageDir + File.separator + websiteImages2);

            String dstPath = websiteImagepath + File.separator + "2.jpg";
            File oldImage = new File(dstPath);

            if( oldImage.exists() ) oldImage.delete();
            temp.renameTo(new File(dstPath) );
        }

        if (StringUtils.isNotBlank(websiteImages3) && !websiteImages3.startsWith("/images") ) {

            Utils.notReplaceFileFromTmpModified(websiteImageDir.getAbsolutePath(), websiteImages3);
            File temp = new File(websiteImageDir + File.separator + websiteImages3);

            String dstPath = websiteImagepath + File.separator + "3.jpg";
            File oldImage = new File(dstPath);

            if( oldImage.exists() ) oldImage.delete();
            temp.renameTo(new File(dstPath) );
        }

        if (StringUtils.isNotBlank(websiteImages4) && !websiteImages4.startsWith("/images") ) {

            Utils.notReplaceFileFromTmpModified(websiteImageDir.getAbsolutePath(), websiteImages4);
            File temp = new File(websiteImageDir + File.separator + websiteImages4);

            String dstPath = websiteImagepath + File.separator + "4.jpg";
            File oldImage = new File(dstPath);

            if( oldImage.exists() ) oldImage.delete();
            temp.renameTo(new File(dstPath) );
        }

        if (StringUtils.isNotBlank(websiteImages5) && !websiteImages5.startsWith("/images")) {

            Utils.notReplaceFileFromTmpModified(websiteImageDir.getAbsolutePath(), websiteImages5);
            File temp = new File(websiteImageDir + File.separator + websiteImages5);

            String dstPath = websiteImagepath + File.separator + "5.jpg";
            File oldImage = new File(dstPath);

            if( oldImage.exists() ) oldImage.delete();
            temp.renameTo(new File(dstPath) );
        }

        resultMessage = "success";
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(resultMessage);
        out.close();
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

    public List<User> getAdministors() {
        return administors;
    }

    public void setAdministors(List<User> administors) {
        this.administors = administors;
    }

    public String getNewAdminEmail() {
        return newAdminEmail;
    }

    public void setNewAdminEmail(String newAdminEmail) {
        this.newAdminEmail = newAdminEmail;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public Integer getImageIndex() {
        return imageIndex;
    }

    public void setImageIndex(Integer imageIndex) {
        this.imageIndex = imageIndex;
    }

    public String getWebsiteImages1() {
        return websiteImages1;
    }

    public void setWebsiteImages1(String websiteImages1) {
        this.websiteImages1 = websiteImages1;
    }

    public String getWebsiteImages2() {
        return websiteImages2;
    }

    public void setWebsiteImages2(String websiteImages2) {
        this.websiteImages2 = websiteImages2;
    }

    public String getWebsiteImages3() {
        return websiteImages3;
    }

    public void setWebsiteImages3(String websiteImages3) {
        this.websiteImages3 = websiteImages3;
    }

    public String getWebsiteImages4() {
        return websiteImages4;
    }

    public void setWebsiteImages4(String websiteImages4) {
        this.websiteImages4 = websiteImages4;
    }

    public String getWebsiteImages5() {
        return websiteImages5;
    }

    public void setWebsiteImages5(String websiteImages5) {
        this.websiteImages5 = websiteImages5;
    }
}
