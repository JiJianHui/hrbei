package com.hrbei.rep.user.dao;

import com.hrbei.rep.ModelDaoImpl;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.user.entity.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
@Repository("userDao")
public class UserDaoImpl extends ModelDaoImpl<User> implements UserDao {

    public User logon(String email, String password) {
        Criteria c=    this.createCriteria(User.class).add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", password));
        List<User> bus = c.list();
        if(bus.size() ==0) return null;
        return bus.get(0);
    }

    public User findByEmail(String email) {
        return findFist("From User u where u.email=?",email);
    }

    public User findByName(String name) {
        return findFist("From User u where u.name=?", name);
    }

    public User findByEmailAndName(String email, String name) {
        return findFist("From User u where  u.email=?  and u.name=? ", email, name);
    }
}
