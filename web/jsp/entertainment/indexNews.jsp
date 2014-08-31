<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-7
  Time: 下午1:51
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<div class="left_content">
    <div style="min-height: 500px;">
    <s:iterator value="newses" id="news">
        <div class="item"><a href="newsBlog.html?news.id=<s:property value="id"/>">
            <s:property value="#news.categorys.get(0).name"/> | <s:property value="#news.title"/>
            |
            <s:date name="#news.pubTime" format="yyyy-MM-dd"/>
        </a></div>
    </s:iterator>
    </div>

    <tiles:insertTemplate template="/jsp/pagination.jsp">
        <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>

    <s:if test="newses.size() == 0">
        对不起，暂时没有新的新闻！
    </s:if>

</div>

<script type="text/javascript">
    <s:if test="typeId == 14">document.getElementById("menuJob").className = 'navSelected';</s:if>
    <s:if test="typeId == 16">document.getElementById("menuRent").className = 'navSelected';</s:if>
    <s:if test="typeId == 20">document.getElementById("menuTechnical").className = 'navSelected';</s:if>
    <s:if test="typeId == 18">document.getElementById("menuArticle").className = 'navSelected';</s:if>
    <s:if test="typeId == 19">document.getElementById("menuJoke").className = 'navSelected';</s:if>
</script>