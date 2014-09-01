package com.hrbei.action;

import com.hrbei.rep.Pagination;
import com.hrbei.rep.category.dao.CategoryDao;
import com.hrbei.rep.category.entity.Category;
import com.hrbei.rep.company.dao.CompanyDao;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.news.dao.NewsDao;
import com.hrbei.rep.news.entity.News;
import com.hrbei.rep.product.dao.ProductDao;
import com.hrbei.rep.product.entity.Product;
import com.hrbei.common.Constants;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-22 22:43
 * Email: jhji@ir.hit.edu.cn
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
@Results({
        @Result(name = "index", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "index"})
})
public class IndexAction extends BasicAction
{
    private Category category;
    private List<Category> categories;
    private CategoryDao categoryDao;

    private Integer typeId;

    private List<News> newses;
    private NewsDao newsDao;

    private List<Product> products;
    private ProductDao productDao;

    private List<Company> companies;
    private CompanyDao companyDao;

    private Pagination pagination = new Pagination(Constants.Page_Size_Index);

    private String searchStr;
    private String searchAllStr;

    private String websiteImages1;
    private String websiteImages2;
    private String websiteImages3;
    private String websiteImages4;
    private String websiteImages5;

    private void getWebsiteImg(){
        websiteImages1 = Constants.Image_Websit_Dir + File.separator + "1.jpg";
        websiteImages2 = Constants.Image_Websit_Dir + File.separator + "2.jpg";
        websiteImages3 = Constants.Image_Websit_Dir + File.separator + "3.jpg";
        websiteImages4 = Constants.Image_Websit_Dir + File.separator + "4.jpg";
        websiteImages5 = Constants.Image_Websit_Dir + File.separator + "5.jpg";
    }

    @Action(value = "index", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".index")})
    public String index(){
        newses = newsDao.findAll(pagination);
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        this.getWebsiteImg();
        this.loadPoster();
        return SUCCESS;
    }

    @Action(value = "indexProuctList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".indexProuctList")})
    public String indexProuctList(){
        pagination.setPageSize(20);
        companies = companyDao.findByCategoryId(this.getTypeId(),pagination);
        products = productDao.findByCategoryId( this.getTypeId(), pagination );
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        return SUCCESS;
    }


    @Action(value = "error", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".error")})
    public String error(){
        return SUCCESS;
    }


    /***********************搜索界面相关************************/

    @Action(value = "initSearchCompany", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initSearchCompany")})
    public String initSearchCompany(){
        pagination.setPageSize(3);
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        companies  = companyDao.findAllCompanyInStatus(Constants.Company_Status_Open,pagination);
        return SUCCESS;
    }


    @Action(value = "searchCompany", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initSearchCompany")})
    public String searchCompany()
    {
        pagination.setPageSize(3);
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        companies  = companyDao.findCompanyByNameLike(this.getSearchStr(), pagination);
        return SUCCESS;
    }

    @Action(value = "initSearchProduct", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initSearchProduct")})
    public String initSearchProduct(){
        pagination.setPageSize(16);
        products = productDao.findAllProducts(pagination);
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        return SUCCESS;
    }

    @Action(value = "searchProduct", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initSearchProduct")})
    public String searchProduct(){
        pagination.setPageSize(16);
        products = productDao.findByNameLike(searchStr,pagination);
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        return SUCCESS;
    }


    /************************导航栏里面工作、招聘等栏目************************/
    @Action(value = "indexNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".indexNews")})
    public String indexNews(){
        pagination.setPageSize(Constants.Page_Size_Index);
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        newses = newsDao.findByCategoryId(typeId, pagination);
        return SUCCESS;
    }

    @Action(value = "searchAll", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchAllResult")})
    public String searchAll(){
        companies = companyDao.findCompanyByNameLike(searchAllStr,pagination);
        products = productDao.findByNameLike(searchAllStr,pagination);
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        return SUCCESS;
    }




    @Action(value = "jobContent", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".jobContent")})
    public String jobContent()
    {
        return SUCCESS;
    }


    @Action(value = "aboutUs", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".aboutUs")})
    public String aboutUs(){
        return SUCCESS;
    }


    @Action(value = "messageBord", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".messageBord")})
    public String messageBord(){
        return SUCCESS;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
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

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
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

    public List<Company> getCompanies() {
        return companies;
    }

    public void setCompanies(List<Company> companies) {
        this.companies = companies;
    }

    public CompanyDao getCompanyDao() {
        return companyDao;
    }

    public void setCompanyDao(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    public String getSearchStr() {
        return searchStr;
    }

    public void setSearchStr(String searchStr) {
        this.searchStr = searchStr;
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

    public String getSearchAllStr() {
        return searchAllStr;
    }

    public void setSearchAllStr(String searchAllStr) {
        this.searchAllStr = searchAllStr;
    }
}
