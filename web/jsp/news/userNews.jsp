<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-24
  Time: 下午6:20
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" type="text/css" href="/css/news/news.css"/>

<div class="stepBar">
    <a href="userNews.html"> 我的新闻</a>
    <span class="sepeator">></span>新闻列表
</div>

<div class="newsBody">

<s:iterator value="newses" status="#status">

    <div class="newsItem">

        <div class="newsTitle">
            <div class="title">
                <img src="/images/lead_img.png"/>
                <a href="newsBlog.html?news.id=<s:property value="id"/>"title="<s:property value="title"/>"><s:property value="title"/></a>
                <%--<span class="date"><s:property value="pubTime.toString()"/></span>--%>
            </div>

        </div>

        <div class="details" style="clear: both">
            <s:property value="content" escape="false"/>
        </div>

        <p class="time">

            <span class="maintenance">
                <span><strong>•</strong><span class="bar">浏览:&nbsp;&nbsp;</span>156</span>
                <span><strong>•</strong><span class="bar">点赞:&nbsp;&nbsp;</span>200次</span>
                <span><strong>•</strong><span class="bar">评论:&nbsp;&nbsp;</span>200条</span>
            </span>

            <a class="manage_links" href="initUpdateUserNews.html?news.id=<s:property value="id"/>">更改</a>

            <a class="manage_links" href="/deleteNews.html?news.id=<s:property value="id"/>">删除</a>
        </p>

    </div>
</s:iterator>

</div>