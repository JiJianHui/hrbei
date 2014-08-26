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

<link href="/css/companyBlog.css" rel="stylesheet" type="text/css" />


<%--公司主页框架，因为公司主页的特殊性，特别为其设置了单独的一个框架来展示。
和基本框架不同的是为其增减了单独的Head以及对内容的控制。但是底部的common links和footer基本保持不变。
--%>

<body style="margin-top: 0px" id="mainBoady">

<div id="main">

    <%--网页顶部，包括了登陆menubar和top展示--%>
    <div class="header"><tiles:insertAttribute name="header"/></div>

    <%--网页中部，用于展示信息--%>
    <div id="container">

        <%--网页中部展示信息主面板--%>
        <div id="container1">

            <div id="companyTop"><tiles:insertAttribute name="companyTop"/></div>
            <div id="componyInfo"><tiles:insertAttribute name="companyInfo"/></div>

            <div style="clear:both;"></div> <!--用于清除浮动来撑高父DIV-->

        </div>

    </div>

    <div id="footerDiv">
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
</div>
<div id="fade" class="black_overlay"></div>
</body>

</html>