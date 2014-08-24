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

    public List<News> findByUserId(Integer uId, Pagination pagination){
        String hql = "From News n where n.pubUser.id=? and n.pubUserType=" + Constants.News_User + " and n.isDeleted = false";
        return this.find(hql, pagination,uId);
    }
}
