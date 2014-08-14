package com.hrbei.action.user;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.common.utils.MD5;
import com.hrbei.rep.user.dao.UserDao;
import com.hrbei.rep.user.entity.User;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-10 15:55
 * Email: jhji@ir.hit.edu.cn
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class UserAction extends BasicAction
{
    private UserDao userDao;
    private User user = new User();

    private String reDirectUrl;
    private String loginMessage;

    /**工具条上弹出的简易登录窗口控制函数。**/
    @Action(value = "ajaxLogin",results = {@Result(name = SUCCESS,type = "json")})
    public String ajaxLogin(){

        if( validateUserInfo(this.getUser().getEmail()) )
        {
            User user = userDao.findByEmail(this.getUser().getEmail());
            userDao.persistAbstract(user);

            setUserToSession(user);
            this.setLoginMessage("success");
        }

        ActionContext.getContext().getValueStack().push(loginMessage);
        return "json";
    }

    private Boolean validateUserInfo(String userEmail)
    {
        User user = userDao.findByEmail(userEmail);
        if (user == null) {
            this.setLoginMessage("账号不存在！");
            return false;
        } else if (!user.getPassword().equals(MD5.endCode(this.user.getPassword()))) {
            this.setLoginMessage("密码不正确！");
            return false;
        }
        return true;

    }

    /******转到的需要登录的正式登录页面*******/
    @Action(value = "login", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".userCenter"),
            @Result(name = "redirect", type = Constants.RESULT_NAME_REDIRECT_ACTION, location = "${reDirectUrl}")})
    public String login() {
        User user = userDao.findByEmail(this.getUser().getEmail());

        setUserToSession(user);
        userDao.persistAbstract(user);


        if (StringUtils.isNotBlank(this.getReDirectUrl())){
            return "redirect";
        }
        return SUCCESS;
    }

    public void validateLogin(){
        User user = userDao.findByEmail(this.getUser().getEmail());
        if (user == null) {
            addFieldError("user.email", "该用户不存在！");
        } else if (!user.getPassword().equals(MD5.endCode(this.user.getPassword()))) {
            addFieldError("user.password", "密码不正确！");
        }
    }

    /*******退出登录函数**********/
    @Action(value = "exitSystem", results = {@Result(name = SUCCESS,
            type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "index"})})
    public String exitSystem() {
        ActionContext.getContext().getSession().clear();
        return SUCCESS;
    }

    /**********************************************用户中心相关函数*********************************/

    @Action(value = "myFirstPage", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".userCenter")})
    public String myFirstPage(){

        return SUCCESS;
    }

    @Action(value = "myCompany", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".myCompany")})
    public String myCompany(){

        return SUCCESS;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getReDirectUrl() {
        return reDirectUrl;
    }

    public void setReDirectUrl(String reDirectUrl) {
        this.reDirectUrl = reDirectUrl;
    }

    public String getLoginMessage() {
        return loginMessage;
    }

    public void setLoginMessage(String loginMessage) {
        this.loginMessage = loginMessage;
    }
}
