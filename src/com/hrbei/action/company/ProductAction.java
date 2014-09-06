package com.hrbei.action.company;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.common.utils.Utils;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.category.dao.CategoryDao;
import com.hrbei.rep.category.entity.Category;
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
 * Time: 2014-08-24 14:42
 * Email: jhji@ir.hit.edu.cn
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class ProductAction extends BasicAction
{
    private User user;
    private UserDao userDao;

    private Company company;
    private CompanyDao companyDao;

    private Product product;
    private ProductDao productDao;
    private List<Product> products;

    private Pagination pagination = new Pagination();

    private String resultMessage;

    private CategoryDao categoryDao;
    private List<Category> categories;
    private List<Integer> categoryIds;

    @Action(value = "initAddProduct", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initAddProduct")})
    public String initAddProduct()
    {
        user = userDao.findById(this.getSessionUserId());
        company = companyDao.findById(this.getCompany().getId());
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        return SUCCESS;
    }

    @Action(value = "saveNewProduct", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION,
            params = {"actionName", "companyProducts","company.id","${company.id}"})})
    public String saveNewProduct()
    {
        company = companyDao.findById(this.getCompany().getId());

        product.setCompany(company);

        // copy jpg
        if (StringUtils.isNotBlank(product.getLogo()) ) {
            String companyDir = ServletActionContext.getServletContext().getRealPath(Constants.Upload_Company_Path);
            companyDir = companyDir + "/" + company.getId() + "/" + "product";

            File temp = new File(companyDir);
            if (!temp.exists()) temp.mkdirs();

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), product.getLogo());
            product.setLogo(Constants.Upload_Company_Path + "/" + company.getId() + "/" + "product" + "/" + product.getLogo());
        }

        //设置类别
        for(Integer categoryId:categoryIds){
            Category category = categoryDao.findById(categoryId);
            if( category != null ){
                product.getCategorys().add(category);
            }
        }

        productDao.persistAbstract(product);

        return SUCCESS;
    }

    @Action(value = "initUpdateProduct", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initUpdateProduct")})
    public String initUpdateProduct()
    {
        user = userDao.findById(this.getSessionUserId());
        product = productDao.findById(this.getProduct().getId());
        company = product.getCompany();
        categories = categoryDao.findAllCategoryByDescription(Constants.Category_Product);
        categoryIds = new ArrayList<Integer>();
        for(Category cag:product.getCategorys() ){ categoryIds.add( cag.getId() ); }
        return SUCCESS;
    }

    @Action(value = "updateProductInfo")
    public void updateProductInfo()
    {
        Product oldProduct = productDao.findById(this.getProduct().getId());
        oldProduct.setName(product.getName());
        oldProduct.setBrand( product.getBrand() );
        oldProduct.setXingHao(product.getXingHao());
        oldProduct.setPrice(product.getPrice());
        oldProduct.setVipPrice(product.getVipPrice());
        oldProduct.setQuanty(product.getQuanty());
        oldProduct.setZhiBiao(product.getZhiBiao());
        oldProduct.setDescription(product.getDescription());

        company = oldProduct.getCompany();

        // copy jpg
        if (StringUtils.isNotBlank(product.getLogo()) && !StringUtils.startsWithIgnoreCase(product.getLogo(), "/upload/")) {
            String companyDir = ServletActionContext.getServletContext().getRealPath(Constants.Upload_Company_Path);
            companyDir = companyDir + "/" + company.getId() + "/" + "product";

            File temp = new File(companyDir);
            if (!temp.exists()) temp.mkdirs();

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), product.getLogo());
            oldProduct.setLogo(Constants.Upload_Company_Path + "/" + company.getId() + "/" + "product" + "/" + product.getLogo());
        }

        //设置类别
        oldProduct.getCategorys().clear();
        for(Integer categoryId:categoryIds){
            Category category = categoryDao.findById(categoryId);
            if( category != null ){
                oldProduct.getCategorys().add(category);
            }
        }

        productDao.persistAbstract(oldProduct);

        try{
            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.print("success");
            out.close();
        }
        catch (Exception e){ e.printStackTrace(); }

    }

    @Action(value = "ajaxDeleteProduct")
    public void ajaxDeleteProduct() throws IOException
    {
        user = userDao.findById(this.getSessionUserId());
        Product oldProduct = productDao.findById(product.getId());

        if( this.hasAccessToProduct(user, oldProduct) )
        {
            oldProduct.setDeleted(true);
            productDao.persist(oldProduct);

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

    @Action(value = "productBlog", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".productBlog")})
    public String productBlog()
    {
        product = productDao.findById(this.getProduct().getId());
        company = product.getCompany();
        return SUCCESS;
    }

    private Boolean hasAccessToProduct(User user, Product product){

        if( product.getCompany().getResponsiblePerson().getId().equals(user.getId()) || this.isAdmin(user) )
        {
            return true;
        }
        return false;
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

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
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

    public CompanyDao getCompanyDao() {
        return companyDao;
    }

    public void setCompanyDao(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }
}
