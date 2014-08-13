package com.hrbei.rep.company.dao;

import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.company.entity.Company;
import org.springframework.stereotype.Repository;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-12 15:27
 * Email: jhji@ir.hit.edu.cn
 */
@Repository("companyDao")
public class CompanyDaoImpl extends ModelDaoImpl<Company> implements CompanyDao {
}
