package com.hrbei.common.utils;

import org.apache.commons.lang.StringUtils;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-10 22:14
 * Email: jhji@ir.hit.edu.cn
 */
public class Utils {

    public static String getEmptyString(String s) {
        return s == null ? "" : s;
    }

    public static Integer getEmptyInteger(Integer s) {
        return s == null ? 0 : s;
    }

    public static String getCountHQLString(String hql) {
        String regex = " (?i)from ";
        hql = " " + hql;
        String[] hqlPart = hql.split(regex);
        if (hqlPart.length > 1) {
            if (StringUtils.containsIgnoreCase(hqlPart[0], "select")) {
                hqlPart[0] = hqlPart[0].replaceFirst("(?i)select", "select count( ") + " ) ";
            } else {
                hqlPart[0] = "select count(*) " + hqlPart[0];
            }

        }
        return StringUtils.join(hqlPart, " from ");
    }
}
