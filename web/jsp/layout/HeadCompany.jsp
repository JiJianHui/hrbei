<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-4-18
  Time: 下午4:19
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--网页顶部1：登录/注册/加入收藏/联系我们/客服/站点导航-->
<div class="headerMenu">

    <dl class="loginRegister">
        <dd style="width:10px;margin-left: 0px;">&nbsp;</dd>
        <dd><a href="#" id="loginButton">登录</a></dd>
        <dd><a href="register.html">注册</a></dd>
    </dl>

    <dl class="headerEmpty"></dl>

    <dl class="links">

        <dd><a href="#"><img src="images/collection.jpg"/>加入收藏</a> </dd>
        <dd>
            <a href="aboutUs.html"><img src="images/contact.jpg" />联系我们</a>
            <ul>
                <li><a href="aboutUs.html">公司简介</a></li>
                <li><a href="aboutUs.html">联系我们</a></li>
                <li><a href="aboutUs.html">公司地址</a></li>
            </ul>
        </dd>
        <dd>
            <a href="#"><img src="images/customerService.jpg"/>客服</a>
            <ul>
                <li><a href="#">在线客服</a></li>
                <li><a href="#">QQ留言</a></li>
                <li><a href="#">投诉/建议</a></li>
            </ul>
        </dd>

        <dd>
            <a href="#"><img src="images/websiteNavigator.jpg" />站点导航</a>
            <ul>
                <li><a href="#">企业栏目</a></li>
                <li><a href="#">加盟企业</a></li>
                <li><a href="index.html">返回主页</a></li>
            </ul>
        </dd>
    </dl>

</div>

<!--网页顶部2：logo/搜索/天气-->
<div id="headerTop" style="height: 70px">

    <div class="companyHeadLogo">
        <a href="index.html" title="哈尔滨电子企业报价网">
            <img src="/images/logo.jpg" class="logoImage" />
        </a>
    </div>

    <div class="verticalSplit"></div>

    <div class="companyHeadInfo">
        <span class="companyHeadName">哈尔滨众城电脑公司</span>
        <span class="companyHeadQQ">
            <a href="#">在线咨询<img src="/images/tixing.jpg"/></a>
            <a href="#">QQ留言<img src="/images/qq.gif"></a>
        </span>
    </div>

    <div class="companyHeadSearch">
        <form id="searchForm" action="#" method="post">
            <input class="inputText" id="searchField" name="searchField" type="text" title="请输入您要查找的关键字" /><input class="inputButton" id="searchInSubmit" name="searchInSubmit" type="button" value="本店搜索" title="本店搜索" />
            <input class="inputButton" id="searchAllSubmit" name="searchAllSubmit" type="button" value="全站搜索" title="全站搜索" />
        </form>
    </div>

</div>

<script type="text/javascript">
    jQuery(".headerMenu").slide({ type:"menu",  titCell:"dd", targetCell:"ul", delayTime:0,defaultPlay:false,returnDefault:true  });

    $("#loginButton").click(function (event) {
        document.getElementById('loginPanel').style.display='block';
        document.getElementById('fade').style.display='block';
        document.body.style.overflow="hidden";
    });

</script>

<div id="loginPanel" class="loginPanel">

    <div class="loginHead">
        <div class="loginHeadLeft">欢迎登陆哈尔滨电子企业报价网</div>
        <div class="loginHeadRight">
            <a href="javascript:void(0)" onclick="document.getElementById('loginPanel').style.display='none';
                             document.getElementById('fade').style.display='none';document.body.style.overflow='scroll' ">
                <%--<img src="/images/close.png"/>--%>[Close]
            </a>
        </div>
    </div>

    <div class="loginContent">

        <form class="form-horizontal" role="form" id="user_login_form" method="post">

            <div class="loginLine">
                <span class="text">邮箱(用户名):</span>
                <input name="str_username" type="text" id="str_username" value="" class="input" tabindex="1" />
            </div>

            <div class="loginLine">
                <span class="text">登陆密码:</span>
                <input name="str_username" type="password" id="password" value="" class="input" tabindex="1" />
            </div>

            <div class="loginLine">
                <input type="checkbox" name="rememberme" checked="checked" id="rememberme" class="loginCheck" />
                <span class="font12">记住我的用户名</span>
                <button type="button" id="log_btn" class="loginButton">登陆</button>
            </div>

            <div class="loginLine">
                <span class="loginLinks"><a href="#" >忘记密码？</a></span>
                <span class="loginLinks"><a href="register.html" >还没有账号？</a></span>
            </div>

        </form>

    </div>

</div>
