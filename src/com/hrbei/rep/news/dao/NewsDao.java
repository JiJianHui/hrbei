package com.hrbei.rep.news.dao;

import com.hrbei.rep.ModelDao;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.news.entity.News;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:28
 * Email: jhji@ir.hit.edu.cn
 */
public interface NewsDao  extends ModelDao<News>
{
    public List<News> findByUserId(Integer uId, Pagination pagination);
    public List<News> findByCompanyId(Integer cId, Pagination pagination);
    public List<News> findAll(Pagination pagination);
}
