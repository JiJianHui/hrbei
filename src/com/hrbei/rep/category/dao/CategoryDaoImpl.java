package com.hrbei.rep.category.dao;

import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.category.entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:27
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("categoryDao")
public class CategoryDaoImpl extends ModelDaoImpl<Category> implements CategoryDao {

    public List<Category> findAllCategory(){
        String hql = "from Category order by id";
        return this.findByHql(hql);
    }

    public List<Category> findAllCategoryByDescription(String description){
        String hql = "from Category cag where cag.description = ? order by id";
        return this.find(hql, description);
    }
}
