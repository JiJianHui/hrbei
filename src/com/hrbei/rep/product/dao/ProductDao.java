package com.hrbei.rep.product.dao;

import com.hrbei.rep.ModelDao;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.product.entity.Product;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:28
 * Email: jhji@ir.hit.edu.cn
 */
public interface ProductDao  extends ModelDao<Product>
{
    public List<Product> findByCompany(Integer cID, Pagination pagination);
    public List<Product> findByUserId(Integer uID, Pagination pagination);
    public List<Product> findByCategoryId(Integer cID, Pagination pagination);

    public List<Product> findAllProducts(Pagination pagination);
    public List<Product> findByNameLike(String searchStr, Pagination pagination);
}
