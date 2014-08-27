package com.hrbei.rep.user.dao;

import com.hrbei.rep.Pagination;
import com.hrbei.rep.user.entity.User;
import com.hrbei.rep.ModelDao;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-10 23:27
 * Email: jhji@ir.hit.edu.cn
 */
public interface UserDao extends ModelDao<User>
{
    //    public void persistAbstract(BaseUser user);
    public User findByEmail(String email);
    public User findByName(String name);
    public User findByEmailAndName(String email, String name);
    public User logon(String email, String password);

    public List<User> findByUserRoleType(Integer roleTypeId, Pagination pagination);

//    public List<User> searchUsers(String searchStr , Pagination pagination);
}
