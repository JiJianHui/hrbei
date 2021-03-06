package com.hrbei.action.company;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.common.utils.Utils;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.category.dao.CategoryDao;
import com.hrbei.rep.category.entity.Category;
import com.hrbei.rep.company.dao.CompanyDao;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.news.dao.NewsDao;
import com.hrbei.rep.news.entity.News;
import com.hrbei.rep.product.dao.ProductDao;
import com.hrbei.rep.product.entity.Product;
import com.hrbei.rep.user.dao.UserDao;
import com.hrbei.rep.user.entity.User;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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

    private Product product;
    private List<Product> products;
    @Autowired
    private ProductDao productDao;

    private List<News> newses;
    private NewsDao newsDao;

    private Pagination pagination = new Pagination();

    private String menu;
    private String resultMessage;

    private CategoryDao categoryDao;
    private List<Category> categories;
    private List<Integer> categoryIds;

    private List<String> adImages;

    @Action(value = "initCreateCompany", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initCreateCompany")})
    public String initCreateCompany()
    {
        user = userDao.findById(this.getSessionUserId());
        if( company == null ) company = new Company();
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);

        adImages = new ArrayList<String>();

        return SUCCESS;
    }

    @Action(value = "saveCompany", results={@Result(name=SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myCompany"})})
    public String ajaxSaveCompanyLogo()
    {
        user = userDao.findById(this.getSessionUserId());
        companyDao.persist(company);
        company.setResponsiblePerson(user);

        user.setUserRoleType(Constants.User_RoleType_Company);
        userDao.persist(user);

        // copy jpg
        this.saveCompanyImage(company);

        //设置类别
        for(Integer categoryId:categoryIds){
            Category category = categoryDao.findById(categoryId);
            if( category != null ){
                company.getCategorys().add(category);
            }
        }

        companyDao.persist(company);

        return SUCCESS;
    }


    @Action(value = "initUpdateCompany", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initUpdateCompany")})
    public String initUpdateCompany()
    {
        user = userDao.findById(this.getSessionUserId());
        company = companyDao.findById(this.getCompany().getId());
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);

        categoryIds = new ArrayList<Integer>();
        for(Category cag:company.getCategorys() ){ categoryIds.add( cag.getId() ); }

        this.loadCompanyADImages(company);

        return SUCCESS;
    }

    private void loadCompanyADImages(Company curCompany){
        String companyDir   = ServletActionContext.getServletContext().getRealPath(Constants.Upload_Company_Path) + "/" + curCompany.getId();
        String companyAdDir = companyDir + "/" + "adImages";

        File adDir = new File(companyAdDir);
        File[] files = adDir.listFiles();

        adImages = new ArrayList<String>();
        for(File file : files ){
            if(file.isFile() ){
                String fName = file.getName();
                String path = Constants.Upload_Company_Path + "/" + curCompany.getId() + "/" + "adImages" + "/" + fName;
                adImages.add(path);
            }
        }
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

        //设置类别
        oldCompany.getCategorys().clear();
        for(Integer categoryId:categoryIds){
            Category category = categoryDao.findById(categoryId);
            if( category != null ){
                oldCompany.getCategorys().add(category);
            }
        }

        this.saveCompanyImage(oldCompany);

        companyDao.persistAbstract(oldCompany);

        return SUCCESS;
    }

    private void saveCompanyImage(Company curCompany){

        String companyDir = ServletActionContext.getServletContext().getRealPath(Constants.Upload_Company_Path) + "/" + curCompany.getId();

        File temp = new File(companyDir);
        if (!temp.exists()) temp.mkdirs();

        // copy jpg
        if (StringUtils.isNotBlank(company.getLogo()) && !StringUtils.startsWithIgnoreCase(company.getLogo(), "/upload/")
                && !StringUtils.startsWithIgnoreCase(company.getLogo(), "/images/")) {

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), company.getLogo());

            curCompany.setLogo(Constants.Upload_Company_Path + "/" + company.getId() + "/" + company.getLogo());
        }

        if (StringUtils.isNotBlank(company.getHomeImage())  && !StringUtils.startsWithIgnoreCase(company.getHomeImage(), "/upload/")
                && !StringUtils.startsWithIgnoreCase(company.getHomeImage(), "/images/") ) {

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), company.getHomeImage());
            curCompany.setHomeImage(Constants.Upload_Company_Path + "/" + company.getId() + "/" + company.getHomeImage());
        }

        if (StringUtils.isNotBlank(company.getAdImage())  && !StringUtils.startsWithIgnoreCase(company.getAdImage(), "/upload/")
                && !StringUtils.startsWithIgnoreCase(company.getAdImage(), "images/")) {

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), company.getAdImage());
            curCompany.setAdImage(Constants.Upload_Company_Path + "/" + company.getId() + "/" + company.getAdImage());
        }

        //拷贝广告照片，首先清空广告文件夹下的照片
        String companyAdDir = companyDir + "/" + "adImages";
        File adDir = new File(companyAdDir);

        if( !adDir.exists() ) adDir.mkdirs();

        for( File file : adDir.listFiles())
        {
            boolean find    = false;
            String fileName = file.getName();

            for(String adImage:adImages){
                if( adImage.contains(fileName) ) find = true;
            }

            if( !find ) file.delete();
        }

        for(String adImage:adImages){
            if( StringUtils.isNotBlank(adImage) && !StringUtils.startsWithIgnoreCase(adImage, "/upload/") ){
                Utils.notReplaceFileFromTmpModified(adDir.getAbsolutePath(), adImage);
            }
        }
    }


    @Action(value = "ajaxDeleteCompany")
    public void ajaxDeleteCompany() throws IOException {

        user = userDao.findById(this.getSessionUserId());
        Company oldCompany = companyDao.findById(company.getId());

        if( this.hasAccessToComapany(user, oldCompany) )
        {
            oldCompany.setDeleted(true);
            companyDao.persist(oldCompany);

            resultMessage = "success";
        }
        else
        {
            resultMessage = "error";
        }

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(resultMessage);
        out.close();
    }

    @Action(value = "ajaxChangeCompanyStatus")
    public void ajaxChangeCompanyStatus() throws IOException {

        user = userDao.findById(this.getSessionUserId());
        Company oldCompany = companyDao.findById(company.getId());

        if( this.hasAccessToComapany(user, oldCompany) )
        {
            oldCompany.setStatus( company.getStatus() );
            companyDao.persist(oldCompany);

            resultMessage = "success";
        }
        else
        {
            resultMessage = "error";
        }

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(resultMessage);
        out.close();
    }

    private Boolean hasAccessToComapany(User user, Company company){

        if( company.getResponsiblePerson().getId().equals(user.getId()) || this.isAdmin(user) )
        {
            return true;
        }
        return false;
    }

    @Action( value = "companyBlog", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".companyBlog") })
    public String companyBlog(){
        company = companyDao.findById(this.getCompany().getId());
        newses = newsDao.findByCompanyId(company.getId(),pagination);
        products = productDao.findByCompany(company.getId(), pagination);

        this.loadCompanyADImages(company);

        return SUCCESS;
    }

    @Action( value = "companyBlogContents", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".companyBlogProducts") })
    public String companyBlogContents(){

        company = companyDao.findById(this.getCompany().getId());

        if( menu.equalsIgnoreCase("product") ){
            pagination.setPageSize(6);
            products = productDao.findByCompany(company.getId(), pagination);
        }
        if( menu.equalsIgnoreCase("news") ){
            pagination.setPageSize(15);
            newses = newsDao.findByCompanyId(company.getId(),pagination);
        }
        if( menu.equalsIgnoreCase("about") ){
        }

        if( menu.equalsIgnoreCase("hire") ){
            pagination.setPageSize(15);
            newses = newsDao.findByCompanyAndCategoryId(company.getId(),Constants.Category_News_Hire, pagination);
        }

        return SUCCESS;
    }

    /*******************************************产品相关***************************************************/

    @Action(value = "companyProducts", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".companyProducts")})
    public String companyProducts()
    {
        user = userDao.findById(this.getSessionUserId());
        company = companyDao.findById(this.getCompany().getId());
        products = productDao.findByCompany( company.getId(), pagination);
        return SUCCESS;
    }


    @Action(value = "cropCompanyAD", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".cropCompanyAD")})
    public String userRegImgCrop(){
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

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }

    public List<News> getNewses() {
        return newses;
    }

    public void setNewses(List<News> newses) {
        this.newses = newses;
    }

    public NewsDao getNewsDao() {
        return newsDao;
    }

    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public List<Integer> getCategoryIds() {
        return categoryIds;
    }

    public void setCategoryIds(List<Integer> categoryIds) {
        this.categoryIds = categoryIds;
    }

    public List<String> getAdImages() {
        return adImages;
    }

    public void setAdImages(List<String> adImages) {
        this.adImages = adImages;
    }
}
