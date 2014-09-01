package com.hrbei.rep.company.dao;

import com.hrbei.rep.ModelDao;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.company.entity.Company;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:28
 * Email: jhji@ir.hit.edu.cn
 */
public interface CompanyDao extends ModelDao<Company>
{
    public List<Company> findMyCompany(Integer userID);

    public List<Company> findAllCompany(Pagination pagination);
    public List<Company> findAllCompanyInStatus(Integer status, Pagination pagination);

    public List<Company> findCompanyByNameLike(String name, Pagination pagination);

    public List<Company> findByCategoryId(Integer cID, Pagination pagination);
}
