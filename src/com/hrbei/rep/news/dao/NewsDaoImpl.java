package com.hrbei.rep.news.dao;

import com.hrbei.common.Constants;
import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.news.entity.News;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:27
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("newsDao")
public class NewsDaoImpl extends ModelDaoImpl<News> implements NewsDao
{
    public static final String DeleteFalse = " n.isDeleted = false";

    public List<News> findByUserId(Integer uId, Pagination pagination){
        String hql = "From News n where n.pubUser.id=? and n.pubUserType=" + Constants.News_User + " and " +  DeleteFalse;
        return this.find(hql, pagination,uId);
    }

    public List<News> findByCompanyId(Integer cId, Pagination pagination){
        String hql = "From News n where n.company.id=? and n.pubUserType=" + Constants.News_Company + " and " + DeleteFalse;
        return this.find(hql, pagination,cId);
    }

    public List<News> findAll(Pagination pagination){
        String hql = "From News n" + " where n.isDeleted = false";
        return  this.find(hql, pagination);
    }

    public List<News> findByCategoryId(Integer cId,Pagination pagination){
        String hql = "select distinct n From News n left join n.categorys category where category.id=? and " + DeleteFalse ;
        return  this.find(hql, pagination, cId);
    }

    public List<News> findByCompanyAndCategoryId(Integer comId, Integer cagId,Pagination pagination){
        String hql = "select distinct n From News n left join n.categorys category where n.company.id = ? and category.id=? and " + DeleteFalse ;
        return  this.find(hql, pagination, comId, cagId);
    }
}
