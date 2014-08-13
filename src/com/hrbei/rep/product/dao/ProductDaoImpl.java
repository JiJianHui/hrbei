package com.hrbei.rep.product.dao;

import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.product.entity.Product;
import org.springframework.stereotype.Repository;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:27
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("productDao")
public class ProductDaoImpl extends ModelDaoImpl<Product> implements ProductDao
{

}
