package com.hrbei.rep.company.dao;

import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.company.entity.Company;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:27
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("companyDao")
public class CompanyDaoImpl extends ModelDaoImpl<Company> implements CompanyDao {

    public static final String DeletedFalse = " com.isDeleted=false ";

    @Override
    public List<Company> findMyCompany(Integer userID)
    {
        String hql = "select com from Company com where com.responsiblePerson.id = ?  and " + DeletedFalse;
        return this.find(hql, userID);
    }

    public List<Company> findAllCompany(Pagination pagination){
        String hql = "from Company com order by com.id  DESC";
        return this.find(hql, pagination);
    }

    public List<Company> findAllCompanyInStatus(Integer status, Pagination pagination){
        String hql = "from Company com where com.status = ?  and " + DeletedFalse;
        return this.find(hql, pagination, status);
    }

    public List<Company> findCompanyByNameLike(String searchStr, Pagination pagination){
        String hql = "select distinct com  From Company com left join  com.categorys category left join com.products product " +
                        "where ( com.name like ? or category.name like ? or product.name like ? ) and " + DeletedFalse;
        return this.find(hql,pagination, "%" + searchStr + "%", "%" + searchStr + "%", "%" + searchStr + "%");
    }
}
