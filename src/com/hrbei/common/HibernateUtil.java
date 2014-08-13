package com.hrbei.common;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-10 15:47
 * Email: jhji@ir.hit.edu.cn
 */

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {
    private static Configuration configuration;
    private static ServiceRegistry serviceRegistry;
    private static SessionFactory sessionFactory;

    static {
        configuration   = new Configuration();
        serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
        sessionFactory  = configuration.buildSessionFactory(serviceRegistry);
    }

    public static Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static Configuration getConfiguration() {
        return configuration;
    }

    public static void setConfiguration(Configuration configuration) {
        HibernateUtil.configuration = configuration;
    }

    public static ServiceRegistry getServiceRegistry() {
        return serviceRegistry;
    }

    public static void setServiceRegistry(ServiceRegistry serviceRegistry) {
        HibernateUtil.serviceRegistry = serviceRegistry;
    }

    public static void main(String[] args) {
        Session session = HibernateUtil.getSession();
        System.out.println(session);
    }
}
