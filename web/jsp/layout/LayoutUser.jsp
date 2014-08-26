<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-7
  Time: 下午8:56
  Email: jhji@ir.hit.edu.cn
  最基本的布局框架，是所有框架的基础。
  该框架包括了顶部Header(最顶层的toolbar和首页Logo及搜索)、中间的content、底部(包括common links和footer)
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
    <link rel="shortcut icon" type="image/x-icon" href="/images/fav.ico"/>
    <meta name="robots" content="index,follow" />
    <!--[if IE 6]->
        <style>
        #root{height:100%;} /* IE在高度不够时会自动撑开层*/
        </style>
    <![endif]-->
    <%@ include file="includeForLayout.jsp" %>
</head>

<link href="/css/user/userLayout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>

<body>

<div id="main" style="margin-top: 0px;">

    <%--网页顶部，包括了登陆menubar和top展示--%>
    <div class="header"><tiles:insertAttribute name="header"/></div>

    <%--网页中部，用于展示信息--%>
    <div id="container">
        <div class="leftMenu"><tiles:insertAttribute name="leftMenu" ignore="true"/></div>
        <div class="rightContent">
            <tiles:insertAttribute name="rightContent"/>
        </div>
        <div style="clear: both;"></div>
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