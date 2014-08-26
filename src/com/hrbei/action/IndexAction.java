package com.hrbei.action;

import com.opensymphony.xwork2.ActionSupport;
import com.hrbei.common.Constants;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-22 22:43
 * Email: jhji@ir.hit.edu.cn
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "index", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "index"})
})
public class IndexAction extends BasicAction
{
    @Action(value = "index", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".index")})
    public String index(){
        return SUCCESS;
    }


    @Action(value = "error", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".error")})
    public String error(){
        return SUCCESS;
    }


    /************************首页相关************************/
    public String indexBiJiBen(){
        return SUCCESS;
    }
    //
    public String indexDianNao(){
        return SUCCESS;
    }
    //
    public String indexBanGong(){
        return SUCCESS;
    }
    //
    public String indexZuZhuangJi(){
        return SUCCESS;
    }
    //
    public String indexWangLuo(){
        return SUCCESS;
    }
    //
    public String indexHaoCai(){
        return SUCCESS;
    }
    //
    public String indexShuMa(){
        return SUCCESS;
    }
    //
    public String indexDianZiJianKong(){
        return SUCCESS;
    }
    //
    public String indexSoftWare(){
        return SUCCESS;
    }
    //
    public String indexJiShuFuWu(){
        return SUCCESS;
    }
    //
    public String indexMobile(){
        return SUCCESS;
    }
    //
    public String indexWaiShe(){
        return SUCCESS;
    }

    /***********************搜索界面相关************************/

    @Action(value = "searchCompany", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchCompany")})
    public String searchCompany(){
        return SUCCESS;
    }

    @Action(value = "searchProduct", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchProduct")})
    public String searchProduct(){
        return SUCCESS;
    }


    /************************导航栏里面工作、招聘等栏目************************/

    @Action(value = "findJob", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".findJob")})
    public String jobList(){
        return SUCCESS;
    }

    @Action(value = "rentList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".rentList")})
    public String rentList(){
        return SUCCESS;
    }

    @Action(value = "technicalList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".technicalList")})
    public String technicalList(){
        return SUCCESS;
    }

    @Action(value = "articleList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".articleList")})
    public String articleList(){
        return SUCCESS;
    }

    @Action(value = "jokeList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".jokeList")})
    public String jokeList(){
        return SUCCESS;
    }

    @Action(value = "jobContent", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".jobContent")})
    public String jobContent()
    {
        return SUCCESS;
    }

    @Action(value = "companyBlog", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".companyBlog")})
    public String companyBlog()
    {
        return SUCCESS;
    }

    @Action(value = "aboutUs", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".aboutUs")})
    public String aboutUs(){
        return SUCCESS;
    }
}
