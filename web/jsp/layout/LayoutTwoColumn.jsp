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

    <%@ include file="includeForLayout.jsp" %>
</head>

<link href="/css/verticalAD.css" rel="stylesheet" type="text/css" />

<link href="/css/index.css" rel="stylesheet" type="text/css" />

<body style="margin-top: 0px" id="mainBoady">

<%--广告框架：该框架将在base框架的基础上对其中的content进行了更加细分：
将内容分为了两列：左侧是显示内容，右侧是显示垂直广告。或者也可以用于显示别的东西。
--%>

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

                <div id="content">
                    <div id="leftContent">
                        <tiles:insertAttribute name="leftContent"/>
                    </div>
                    <div id="rightContent">
                        <tiles:insertAttribute name="rightContent"/>
                    </div>
                </div>

            </div>
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