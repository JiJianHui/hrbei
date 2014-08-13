package com.hrbei.rep.news.dao;

import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.news.entity.News;
import org.springframework.stereotype.Repository;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:27
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("newsDao")
public class NewsDaoImpl extends ModelDaoImpl<News> implements NewsDao
{

}
