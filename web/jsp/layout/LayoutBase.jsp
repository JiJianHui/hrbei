<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-4-18
  Time: 下午3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><tiles:insertAttribute name="title" ignore="true" /></title>
    <meta name="Keywords" content="哈尔滨电子企业报价网" />
    <meta name="description" content="哈尔滨电子企业报价网 " />
    <meta name="robots" content="index,follow" />
    <link rel="shortcut icon" type="image/x-icon" href="/images/fav.ico"/>
    <!--[if IE 6]->
        <style>
        #root{height:100%;} /* IE在高度不够时会自动撑开层*/
        </style>
    <![endif]-->
    <%@ include file="includeForLayout.jsp" %>
</head>

<%--该框架是前端展示给用户的基本框架。
在基本的layout的基础上对中间的content内容进行了扩展，
将content分为了左侧导航，右侧分为了顶部导航和中间content内容--%>
<body style="margin-top: 0px" id="mainBoady">

    <div id="main">

        <%--网页顶部，包括了登陆menubar和top展示--%>
        <div class="header"><tiles:insertAttribute name="header"/></div>

        <%--网页中部，用于展示信息--%>
        <div id="container">

            <%--网页中部展示信息主面板--%>
            <div id="container1">
                <div id="left"><tiles:insertAttribute name="leftMenu"/></div>
                <div id="right">
                    <div id="navigator"><tiles:insertAttribute name="navigator"/></div>
                    <div id="content"><tiles:insertAttribute name="content"/></div>
                </div>
                <div style="clear:both;"></div> <!--用于清除浮动来撑高父DIV-->
            </div>

        </div>

        <div class="commonLinks">
                <a href="#">中关村在线</a>
                <a href="#">百度</a>
                <a href="#">58同城</a>
                <a href="#">网易163</a>
                <a href="#">搜狐网</a>
                <a href="#">新浪微博</a>
                <a href="#">驱动之家</a>
            </div>

       <%--网页底部用于展示版权信息等--%>
        <div id="footer"><tiles:insertAttribute name="footer"/></div>

    </div>
    <div id="fade" class="black_overlay"></div>
</body>

</html>