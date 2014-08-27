package com.hrbei.action.company;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.rep.Pagination;
import com.hrbei.rep.company.dao.CompanyDao;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.news.dao.NewsDao;
import com.hrbei.rep.news.entity.News;
import com.hrbei.rep.user.dao.UserDao;
import com.hrbei.rep.user.entity.User;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-24 19:59
 * Email: jhji@ir.hit.edu.cn
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class NewsAction extends BasicAction {

    private User user;
    private UserDao userDao;

    private News news;
    private List<News> newses;
    private NewsDao newsDao;

    private Company company;
    private CompanyDao companyDao;

    private Pagination pagination = new Pagination();

    private String resultMessage;

    @Action( value = "initCreateUserNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initCreateUserNews")})
    public String initCreateNews(){
        user = userDao.findById( this.getSessionUserId() );
        return SUCCESS;
    }

    @Action( value = "initCreateCompanyNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initCreateCompanyNews")})
    public String initCreateCompanyNews(){
        user = userDao.findById( this.getSessionUserId() );
        company = companyDao.findById(this.getCompany().getId());
        return SUCCESS;
    }

    @Action( value = "saveUserNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "userNews"}) })
    public String saveUserNews(){
        user = userDao.findById( this.getSessionUserId() );

        news.setPubUser(user);
        news.setPubUserType(Constants.News_User);

        newsDao.persistAbstract(news);

        return SUCCESS;
    }

    @Action( value = "saveCompanyNews",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "companyNews","company.id","${company.id}"}) })
    public String saveCompanyNews(){
        user = userDao.findById( this.getSessionUserId() );
        company = companyDao.findById(this.getCompany().getId());

        //news.setPubUser(user);
        //news.setPubUserType(Constants.News_User);
        news.setCompany(company);
        news.setPubUserType(Constants.News_Company);

        newsDao.persistAbstract(news);

        return SUCCESS;
    }

    @Action( value = "userNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".userNews") })
    public String userNews(){
        user = userDao.findById( this.getSessionUserId() );
        newses = newsDao.findByUserId(user.getId(), pagination);
        return SUCCESS;
    }

    @Action( value = "companyNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".companyNews") })
    public String companyNews(){
        //newses = newsDao.findByUserId(this.getCompany().getId(), pagination);
        company = companyDao.findById(this.getCompany().getId());
        newses = newsDao.findByCompanyId(this.getCompany().getId(),pagination);
        return SUCCESS;
    }

    @Action( value = "initUpdateUserNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initUpdateUserNews") })
    public String initUpdateUserNews(){
        user = userDao.findById( this.getSessionUserId() );
        news = newsDao.findById(this.getNews().getId());
        return SUCCESS;
    }

    @Action( value = "initUpdateCompanyNews", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initUpdateCompanyNews") })
    public String initUpdateCompanyNews(){
        user = userDao.findById( this.getSessionUserId() );
        news = newsDao.findById(this.getNews().getId());
        company = companyDao.findById(this.getCompany().getId());
        return SUCCESS;
    }

    @Action( value = "updateUserNews")
    public void updateUserNews(){
        News oldNews = newsDao.findById(this.getNews().getId());
        oldNews.setTitle(news.getTitle());
        oldNews.setAuthor(news.getAuthor());
        oldNews.setPubTime(news.getPubTime());
        oldNews.setPubOrg(news.getPubOrg());
        oldNews.setContent(news.getContent());

        newsDao.persist(oldNews);

        try{
            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.print("success");
            out.close();
        }
        catch (Exception e){ e.printStackTrace(); }
    }

    @Action( value = "updateCompanyNews")
    public void updateCompanyNews(){
        News oldNews = newsDao.findById(this.getNews().getId());
        oldNews.setTitle(news.getTitle());
        oldNews.setAuthor(news.getAuthor());
        oldNews.setPubTime(news.getPubTime());
        oldNews.setPubOrg(news.getPubOrg());
        oldNews.setContent(news.getContent());

        newsDao.persist(oldNews);

        try{
            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.print("success");
            out.close();
        }
        catch (Exception e){ e.printStackTrace(); }
    }

    @Action(value = "ajaxDeleteUserNews")
    public void ajaxDeleteUserNews() throws IOException {

        user = userDao.findById(this.getSessionUserId());
        News oldNews = newsDao.findById(news.getId());

        if( this.hasAccessToUserNews(user, oldNews)) {
            oldNews.setDeleted(true);
            newsDao.persist(oldNews);

            resultMessage = "success";
        }
        else{
            resultMessage = "error";
        }

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(resultMessage);
        out.close();
    }

    @Action( value = "newsBlog", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".newsBlog") })
    public String newsBlog(){
        news = newsDao.findById(this.getNews().getId());
        return SUCCESS;
    }


    private Boolean hasAccessToUserNews(User user, News news){

        if(news.getPubUser() != null )
        {
            if( news.getPubUser().getId().equals(user.getId())|| this.isAdmin(user) ){
                return true;
            }
        }else{
            if( news.getCompany().getResponsiblePerson().getId().equals(user.getId()) ){
                return  true;
            }
        }

        return false;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public NewsDao getNewsDao() {
        return newsDao;
    }

    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public CompanyDao getCompanyDao() {
        return companyDao;
    }

    public void setCompanyDao(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<News> getNewses() {
        return newses;
    }

    public void setNewses(List<News> newses) {
        this.newses = newses;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }
}
