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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><tiles:insertAttribute name="title" ignore="true"/></title>
    <meta name="Keywords" content="哈尔滨电子企业报价网" />
    <meta name="description" content="哈尔滨电子企业报价网 " />
    <meta name="robots" content="index,follow" />
    <link rel="shortcut icon" type="image/x-icon" href="/images/fav.ico"/>

    <link href="/css/index.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]->
        <style>
        #root{height:100%;} /* IE在高度不够时会自动撑开层*/
        </style>
    <![endif]-->
    <%@ include file="includeForLayout.jsp" %>
</head>



<body>

<div id="main" style="margin-top: 0px;" id="mainBoady">

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
        </div>

        <%--网页中部的底部用于展示广告灯--%>
        <div id="container2"><tiles:insertAttribute name="scrollADs"/></div>
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
