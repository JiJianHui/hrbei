<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-4-18
  Time: 下午4:19
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!--网页顶部1：登录/注册/加入收藏/联系我们/客服/站点导航-->
<div class="headerMenu">

    <dl class="loginRegister">
        <s:if test="#session.email != null">
            <dd class="loginSuccessName">
                <a href="myFirstPage.html">欢迎您，<s:property value="#session.nickName"/><img src="images/contact.jpg" /></a>
                <ul>
                    <li><a href="userCenter.html">个人中心</a></li>
                    <li><a href="userInfo.html">账号设置</a></li>
                    <li><a href="exitSystem.html">退出登录</a></li>
                </ul>
            </dd>
        </s:if>
        <s:else>
            <dd style="width:10px;margin-left: 0px;">&nbsp;</dd>
            <dd><a id="loginButton">登录</a></dd>
            <dd><a href="register.html">注册</a></dd>
        </s:else>
    </dl>

    <dl class="headerEmpty"></dl>

    <dl class="links">

        <dd><a href="javascript:void(0)" onclick="AddFavorite(window.location,document.title)"><img src="images/collection.jpg"/>加入收藏</a> </dd>
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
<div id="headerTop">

    <div class="logo">
        <a href="index.html" title="哈尔滨电子企业报价网"><img src="/images/logo.jpg" class="logoImage" /></a>
    </div>

    <!--搜索部分-->
    <div class="search" align="center">
        <form id="searchForm" action="#" method="post">
            <input id="searchField" name="searchField" type="text" title="请输入您要查找的关键字" /><input id="searchSubmit" name="searchSubmit" type="button" value="搜索" title="搜索" />
        </form>
    </div>

    <!--天气部分-->
    <div id="weather">
        <%--<iframe width="250" scrolling="no" height="100" frameborder="0" allowtransparency="true"--%>
                <%--src="http://i.tianqi.com/index.php?c=code&id=8&icon=1&py=haerbin&num=3">--%>
        <%--</iframe>--%>
            <%--<iframe width="250" scrolling="no" height="100" frameborder="0" allowtransparency="true"--%>
                    <%--src="http://i.tianqi.com/index.php?c=code&id=19&color=%23C6C6C6&icon=1&temp=0&num=2">--%>
            <%--</iframe>--%>
            <iframe width="250" scrolling="no" height="90" frameborder="0" allowtransparency="true"
                    src="http://i.tianqi.com/index.php?c=code&id=2&color=%23C6C6C6&icon=1&num=1"></iframe>
    </div>

</div>

<%--登录弹窗js控制及面板--%>
<script type="text/javascript">
    jQuery(".headerMenu").slide({ type:"menu",  titCell:"dd", targetCell:"ul", delayTime:0,defaultPlay:false,returnDefault:true  });

    $("#loginButton").click(function (event) {
        document.getElementById('loginPanel').style.display='block';
        document.getElementById('fade').style.display='block';
        $("#login_tip").text("");
        document.body.style.overflow="hidden";
    });
    function AddFavorite(sURL, sTitle)
    {
        sURL = encodeURI(sURL);
        try
        {
            window.external.addFavorite(sURL, sTitle);
        }
        catch (e)
        {
            try
            {
                window.sidebar.addPanel(sTitle, sURL, "");
            }
            catch (e)
            {
                alert("加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }


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

        <s:form class="form-horizontal" role="form" id="user_login_form" method="post">

            <div class="errorinfo" id="login_tip" style="margin-left: 50px;margin-top: 20px;"></div>
            <div class="loginLine">
               <span class="text">邮箱(用户名):</span>
               <input name="user.email" type="text" id="inputEmail" value="" class="input" tabindex="1" />
            </div>

            <div class="loginLine">
                <span class="text">登陆密码:</span>
                <input name="user.password" type="password" id="inputPassword" value="" class="input" tabindex="1" />
            </div>

            <div class="loginLine">
                <input type="checkbox" checked="checked" id="rememberme" class="loginCheck" />
                <span class="font12">记住我的用户名</span>
                <button type="button" id="log_btn" class="loginButton">登陆</button>
            </div>

            <div class="loginLine">
                <span class="loginLinks"><a href="#" >忘记密码？</a></span>
                <span class="loginLinks"><a href="register.html" >还没有账号？</a></span>
            </div>

        </s:form>

        </div>

</div>




