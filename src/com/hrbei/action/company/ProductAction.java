package com.hrbei.action.company;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.common.utils.Utils;
import com.hrbei.rep.Pagination;
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
import java.io.PrintWriter;
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

    private Product product;
    private ProductDao productDao;
    private List<Product> products;

    private Pagination pagination = new Pagination();

    @Action(value = "initUpdateProduct", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".initUpdateProduct")})
    public String initUpdateProduct()
    {
        user = userDao.findById(this.getSessionUserId());
        product = productDao.findById(this.getProduct().getId());
        company = product.getCompany();
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
        if (StringUtils.isNotBlank(product.getLogo()) && !StringUtils.startsWithIgnoreCase(product.getLogo(), "upload/")) {
            String companyDir = ServletActionContext.getServletContext().getRealPath(Constants.Upload_Company_Path);
            companyDir = companyDir + File.separator + company.getId() + File.separator + "product";

            File temp = new File(companyDir);
            if (!temp.exists()) temp.mkdirs();

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), product.getLogo());
            oldProduct.setLogo(Constants.Upload_Company_Path + File.separator + company.getId() + File.separator + "product" + File.separator + product.getLogo());
        }
        productDao.persistAbstract(oldProduct);

        try{
            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.print("success");
            out.close();
        }
        catch (Exception e){ e.printStackTrace(); }

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
}
