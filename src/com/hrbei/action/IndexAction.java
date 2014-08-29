package com.hrbei.action;

import com.hrbei.rep.Pagination;
import com.hrbei.rep.category.dao.CategoryDao;
import com.hrbei.rep.category.entity.Category;
import com.hrbei.rep.news.dao.NewsDao;
import com.hrbei.rep.news.entity.News;
import com.hrbei.rep.product.dao.ProductDao;
import com.hrbei.rep.product.entity.Product;
import com.hrbei.common.Constants;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

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

    private Integer typeId = 0;

    private List<News> newses;
    private NewsDao newsDao;

    private List<Product> products;
    private ProductDao productDao;

    private Pagination pagination = new Pagination(Constants.Page_Size_Index);

    @Action(value = "index", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".index")})
    public String index(){
        categories = categoryDao.findAllCategory();
        newses = newsDao.findAll(pagination);
        return SUCCESS;
    }

    @Action(value = "indexProuctList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".indexProuctList")})
    public String indexProuctList(){
        categories = categoryDao.findAllCategory();
        pagination.setPageSize(20);
        products = productDao.findByCategoryId( this.getTypeId(), pagination );
        return SUCCESS;
    }


    @Action(value = "error", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".error")})
    public String error(){
        return SUCCESS;
    }


    /***********************搜索界面相关************************/

    @Action(value = "searchCompany", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchCompany")})
    public String searchCompany(){
        return SUCCESS;
    }

    @Action(value = "searchProduct", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchProduct")})
    public String searchProduct(){
        return SUCCESS;
    }


    /************************导航栏里面工作、招聘等栏目************************/

    @Action(value = "findJob", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".findJob")})
    public String jobList(){
        return SUCCESS;
    }

    @Action(value = "rentList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".rentList")})
    public String rentList(){
        return SUCCESS;
    }

    @Action(value = "technicalList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".technicalList")})
    public String technicalList(){
        return SUCCESS;
    }

    @Action(value = "articleList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".articleList")})
    public String articleList(){
        return SUCCESS;
    }

    @Action(value = "jokeList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".jokeList")})
    public String jokeList(){
        return SUCCESS;
    }

    @Action(value = "jobContent", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".jobContent")})
    public String jobContent()
    {
        return SUCCESS;
    }

    @Action(value = "companyBlog", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".companyBlog")})
    public String companyBlog()
    {
        return SUCCESS;
    }

    @Action(value = "aboutUs", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".aboutUs")})
    public String aboutUs(){
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
}
