<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-7-21
  Time: 下午4:00
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<div class="left_content" style="border-right:dotted 0px blue;border-left: dotted 0px blue; min-height: 400px;">

    <%--<div class="item"><a href="jobContent.html" title="">平板 | 平板测首款64位安卓平板 科技巨头总部比拼</a></div>--%>
    <div style="min-height: 500px;">
    <s:iterator value="newses">
        <div class="item">
            <a href="newsBlog.html?news.id=<s:property value="id"/>" title="">
                <s:property value="pubOrg"/>&nbsp;|&nbsp;<s:property value="title"/>&nbsp;<s:date name="pubTime" format="yyyy-MM-dd"/>
            </a>
        </div>
    </s:iterator>
    </div>

    <tiles:insertTemplate template="/jsp/pagination.jsp">
        <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>
</div>

<!--右侧正文内容-->
<div class="right_content">

    <!--滚动的图片广告-->
    <div id="scrollAd">
        <div id="fade_focus">
            <div class="loading">Loading...</div>
            <ul>
                <li><a href="#"><img src="images/RandomAdPic/1.jpg" width="300" height="185" /></a></li>
                <li><a href="#"><img src="images/RandomAdPic/2.jpg" width="300" height="185" /></a></li>
                <li><a href="#"><img src="images/RandomAdPic/3.jpg" width="300" height="185" /></a></li>
                <li><a href="#"><img src="images/RandomAdPic/4.jpg" width="300" height="185" /></a></li>
                <li><a href="#"><img src="images/RandomAdPic/5.jpg" width="300" height="185" /></a></li>
            </ul>
        </div>
    </div>

    <!--登录/注册-->
    <div id="login">
        <img src="images/login.jpg"  usemap="#Map"/>
        <map name="Map" class="Map">
            <area shape="rect" coords="96,27,175,47" href="login.html" title="登录" />
            <area shape="rect" coords="198,27,276,47" href="register.html" title="注册" />
            <area shape="rect" coords="215,50,282,68" href="forgestPassword.html" title="忘记密码？" />
        </map>
    </div>
</div>