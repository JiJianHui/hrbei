package com.hrbei.action;

import com.hrbei.common.Constants;
import com.hrbei.rep.Pagination;
import com.hrbei.common.utils.Utils;
import com.hrbei.rep.user.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class BasicAction extends ActionSupport
{
    //    public static final String BASIC_PACKAGE = "basic-package";
    public static final String BASE_NAME_SPACE = "/";
    public static final String RESULT_JSON = "json";
    public static String HOST_URL_APP;
    public static String REAL_PATH_FOR_BASE_DIR;

    public static final String COMMON_ERROR = "common_error";

    private Pagination pagination = new Pagination();

    protected Logger logger = LogManager.getLogger(this.getClass().getName());

    private String websiteLinks1;
    private String websiteLinks2;
    private String websiteLinks3;
    private String websiteLinks4;
    private String websiteLinks5;

    public String getRealPathForBaseDir() {

        if (REAL_PATH_FOR_BASE_DIR == null) {
            return REAL_PATH_FOR_BASE_DIR = ServletActionContext.getServletContext().getRealPath("/");
        } else {
            return REAL_PATH_FOR_BASE_DIR;
        }
    }

    public void redirectToLogin() {

        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
        try {
            response.sendRedirect("login.html?reDirectUrl=" + request.getServletPath() + "?" +
                    java.net.URLEncoder.encode(Utils.getEmptyString(request.getQueryString()), "utf-8"));
        } catch (IOException e) {
            logger.error("error in redirectToLogin : ", e);
        }
    }

    protected Integer getSessionUserId() {

        if (ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID) != null)
            return (Integer) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
        return null;
    }

    public void loadPoster() {

        String line;
        String fPath = ServletActionContext.getServletContext().getRealPath("/poster.txt");
        try {
            BufferedReader br = new BufferedReader(new FileReader(fPath));
            line = br.readLine();
            if (line.trim().length() == 0) line = "index.html";
            this.websiteLinks1 = line;

            line = br.readLine();
            if (line.trim().length() == 0) line = "index.html";
            this.websiteLinks2 = line;

            line = br.readLine();
            if (line.trim().length() == 0) line = "index.html";
            this.websiteLinks3 = line;

            line = br.readLine();
            if (line.trim().length() == 0) line = "index.html";
            this.websiteLinks4 = line;

            line = br.readLine();
            if (line.trim().length() == 0) line = "index.html";
            this.websiteLinks5 = line;

            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected String getSessionNickName() {

        return (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_NANE);
    }

    protected String getSessionUserEmail() {

        return (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_EMAIL);
    }

    public static String getBasePath() {

        if (HOST_URL_APP != null) {
            return HOST_URL_APP;
        }
        if (ActionContext.getContext() == null) {
            return "http://www.hrbei.com";
        }
        ActionContext ctx = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
        //        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        /**
        if (basePath.contains("beta")) {
            HOST_URL_APP = "http://beta.gogowise.com";
        } else if (basePath.contains("localhost")) {
            HOST_URL_APP = "http://localhost:8080";
        } else if (basePath.contains("test")) {
            HOST_URL_APP = "http://test.gogowise.com";
        } else if(basePath{
            HOST_URL_APP = "http://www.gogowise.com";
        }
         **/
        HOST_URL_APP = "http://www.hrbei.com";
        return HOST_URL_APP;
    }

    protected void setUserToSession(User user) {

        ActionContext.getContext().getSession().put(Constants.SESSION_USER_ID, user.getId());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_NANE, user.getNickName());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_EMAIL, user.getEmail());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_LOGO_URL, user.getLogo());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_ROLE_TYPE, user.getUserRoleType());
    }


    public Pagination getPagination() {

        return pagination;
    }

    public void setPagination(Pagination pagination) {

        this.pagination = pagination;
    }

    public void addActionErrorInfoWithKey(String messageKey) {

        this.addActionError(this.getText(messageKey));
    }

    public boolean isAdmin(User user){
        if( user.getUserRoleType().equals(Constants.User_RoleType_Maintain) ) return true;
        if( user.getUserRoleType().equals(Constants.User_RoleType_Admin) ) return true;
        return false;
    }

    public String getWebsiteLinks1() {
        return websiteLinks1;
    }

    public void setWebsiteLinks1(String websiteLinks1) {
        this.websiteLinks1 = websiteLinks1;
    }

    public String getWebsiteLinks2() {
        return websiteLinks2;
    }

    public void setWebsiteLinks2(String websiteLinks2) {
        this.websiteLinks2 = websiteLinks2;
    }

    public String getWebsiteLinks3() {
        return websiteLinks3;
    }

    public void setWebsiteLinks3(String websiteLinks3) {
        this.websiteLinks3 = websiteLinks3;
    }

    public String getWebsiteLinks4() {
        return websiteLinks4;
    }

    public void setWebsiteLinks4(String websiteLinks4) {
        this.websiteLinks4 = websiteLinks4;
    }

    public String getWebsiteLinks5() {
        return websiteLinks5;
    }

    public void setWebsiteLinks5(String websiteLinks5) {
        this.websiteLinks5 = websiteLinks5;
    }
}
