package com.hrbei.rep.product.dao;

import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.product.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:27
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("productDao")
public class ProductDaoImpl extends ModelDaoImpl<Product> implements ProductDao
{
    public List<Product> findByCompany(Integer cID, Pagination pagination)
    {
        String hql = "From Product p where p.company.id=? and p.company.isDeleted=false and p.isDeleted = false";

        return  this.find(hql,pagination,cID);
    }

    public List<Product> findByUserId(Integer uID, Pagination pagination){

        String hql = "From Product p where p.company.responsiblePerson.id=? and p.company.isDeleted=false and p.isDeleted = false";
        return  this.find(hql,pagination,uID);
    }
}
