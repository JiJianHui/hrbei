package com.hrbei.common.utils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.hibernate.SessionFactory;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-11 10:33
 * Email: jhji@ir.hit.edu.cn
 */
public class RollBackForAction extends AbstractInterceptor
{
    private SessionFactory sessionFactory;

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        try {
            return invocation.invoke();
        } catch (Exception e) {
            try{
                e.printStackTrace();
                sessionFactory.getCurrentSession().getTransaction().rollback();
            }catch (Exception ex) {
                ex.printStackTrace();
            }
            throw e;
        }
    }



    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
