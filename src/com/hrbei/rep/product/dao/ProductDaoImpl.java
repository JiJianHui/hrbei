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
    //TODO 需要考虑公司停止运行之后的产品搜索
    public static final String DeletedFalse = " p.company.isDeleted=false and p.isDeleted = false";

    public List<Product> findByCompany(Integer cID, Pagination pagination)
    {
        String hql = "From Product p where p.company.id=? and " + DeletedFalse;

        return  this.find(hql,pagination,cID);
    }

    public List<Product> findByUserId(Integer uID, Pagination pagination){

        String hql = "From Product p where p.company.responsiblePerson.id=? and " + DeletedFalse;
        return  this.find(hql,pagination,uID);
    }

    public List<Product> findByCategoryId(Integer cID, Pagination pagination){
        String hql = "select distinct p From Product p left join p.categorys category where category.id=? and " + DeletedFalse;
        return  this.find(hql,pagination,cID);
    }

    public List<Product> findAllProducts(Pagination pagination){
        String hql = "From Product p where " + DeletedFalse;
        return  this.find(hql,pagination);
    }

    public List<Product> findByNameLike(String searchStr, Pagination pagination){
        String hql = "select distinct p  From Product p left join  p.categorys category" +
                " where ( p.name like ? or category.name like ? or p.brand like ? ) and " + DeletedFalse;
        return this.find(hql,pagination, "%" + searchStr + "%", "%" + searchStr + "%", "%" + searchStr + "%");
    }
}
