<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-24
  Time: 下午6:19
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link rel="stylesheet" type="text/css" href="/css/news/news.css"/>

<div class="stepBar">
    <a href="userCenter.html"><s:property value="user.nickName"/> </a>
    <span class="sepeator">></span>
    <a href="initCreateUserNews.html"> 发布新闻</a>
    <span class="sepeator">></span>
</div>

<s:form id="newNewsInfoForm" method="post" cssClass="form-horizontal" action="saveUserNews">

<div class="newsBody">
    <div class="newsLine">
        <label class="control-label text"> 作者:</label>
        <s:textfield name="news.author" id="author" cssClass="input inputShort"/>
        <label class="control-label text"> 标题:</label>
        <s:textfield name="news.title" id="title" cssClass="input"/>
    </div>

    <div class="newsLine">
        <label class="control-label text"> 时间:</label>
        <s:textfield name="news.pubTime" id="pubTime" cssClass="input inputShort"/>
        <label class="control-label text"> 来源:</label>
        <s:textfield name="news.pubOrg" id="pubOrg" cssClass="input"/>
    </div>

    <div class="newsLine longtext">
        <label class="control-label text textLong"> 请输入新闻正文内容:</label>
        <textarea rows="50" cols="50" name="news.content" class="longEditor"></textarea>
    </div>


</div>

<div style="clear: both;"></div>
<div class="submitDiv">
    <input type="submit" id="pubProduct" class="btn btn-primary btn-success" value="发布该新闻"/>
    <span id="submit_msg" style="color:red; font-weight: bold;font-size: 13px"></span>
</div>

</s:form>

<%@ include file="news.js.jsp" %>