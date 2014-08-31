package com.hrbei.rep.category.dao;

import com.hrbei.rep.ModelDao;
import com.hrbei.rep.category.entity.Category;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:28
 * Email: jhji@ir.hit.edu.cn
 */
public interface CategoryDao extends ModelDao<Category>
{
    public List<Category> findAllCategory();
    public List<Category> findAllCategoryByDescription(String description);
}
