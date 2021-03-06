package com.hrbei.common.filter;

import com.hrbei.common.Constants;
import com.hrbei.common.utils.Utils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class MainFilter implements Filter {

    private static Logger logger = LogManager.getLogger(MainFilter.class.getName());
    //    private static Logger logger = LogManager.getLogger(MainFilter.class);
    private static List<String> NEED_LOGIN = new ArrayList<String>();


    static {
        NEED_LOGIN.add("/userInfo.html");
        NEED_LOGIN.add("/userCenter.html");

        NEED_LOGIN.add("/initCreateCompany.html");
        NEED_LOGIN.add("/initUpdateCompany.html");
        NEED_LOGIN.add("/updateCompanyInfo.html");

        NEED_LOGIN.add("/initAddProduct.html");
        NEED_LOGIN.add("/initUpdateProduct.html");
        NEED_LOGIN.add("/companyProducts.html");

        NEED_LOGIN.add("/initCreateUserNews.html");
        NEED_LOGIN.add("/userNews.html");
        NEED_LOGIN.add("/initUpdateUserNews.html");

        NEED_LOGIN.add("/myCompany.html");
        NEED_LOGIN.add("/myProducts.html");

        NEED_LOGIN.add("/initAdminManageUser.html");
        NEED_LOGIN.add("/manageWebsite.html");
        NEED_LOGIN.add("/manageCompany.html");
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");

        String requestUrl = request.getServletPath();
        try {

            for (String url : NEED_LOGIN) {
                if (StringUtils.startsWithIgnoreCase(requestUrl, url) && session.getAttribute(Constants.SESSION_USER_ID) == null) {
                    response.sendRedirect("login.html?reDirectUrl=" + request.getServletPath() + "?" +
                            java.net.URLEncoder.encode(Utils.getEmptyString(request.getQueryString()), "utf-8"));
                    return;
                }
            }
//        if ( StringUtils.startsWithIgnoreCase(requestUrl, "/higSec")
//                && (session.getAttribute(Constants.HIG_SEC_USER_EMAIL) ==null ||!"zlhades@hotmail.com".equalsIgnoreCase((String) session.getAttribute(Constants.HIG_SEC_USER_EMAIL)) )) {
//            response.sendRedirect("easyLogon.html");
//            return;
//        }
            arg2.doFilter(arg0, arg1);


        } catch (Throwable e) {
            logger.error("error==:", e);
            response.sendRedirect("/error.htm");
        }
    }


}
