package com.hrbei.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-27 22:31
 * Email: jhji@ir.hit.edu.cn
 */

public class Test
{
    public static void main(String args[]) throws IOException {
        /**
        Company s = new Company();
        s.setId(1L);
        s.setName("zhangsan");
        s.setEmail("11@qq.com");
        s.setPassword("11");

        ServiceRegistry serviceRegistry = null;
        Configuration configuration = new Configuration().configure();
        serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
        SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(s);
        session.getTransaction().commit();
         **/
        run();
    }

    public static void run() throws IOException {

        System.out.println(File.separator);
        System.out.println(File.separatorChar);
    }

    private static String printFiveTimes(String content){
        for( int index = 0; index < 5; index++)
        {
            System.out.println(content);
        }

        System.out.println("************");

        return null;
    }

    private static void getFromKeybord() throws IOException {
        String str = "";
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in) );
        str = br.readLine();

        System.out.println(str);
    }
}