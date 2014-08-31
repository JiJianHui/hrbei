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

<a href="myCompany.html"> 我的公司</a>
<span class="sepeator">></span>
<a href="companyBlog.html?company.id=<s:property value='company.id'/>"><s:property value="company.name"/> </a>
<span class="sepeator">></span>
<a href="newsBlog.html?news.id=<s:property value='news.id'/>"><s:property value="news.title"/> </a>
<span class="sepeator">></span>
<a href="initCreateCompanyNews.html"> 更改新闻</a>

<s:form id="updateNewsForm" method="post" cssClass="form-horizontal" action="updateCompanyNews">
    <s:hidden name="news.id" id="news_id"/>
    <s:hidden name="company.id" id="company_id"/>
    <div class="newsBody">
        <div class="newsLine">
            <label class="control-label text"> 作者:</label>
            <s:textfield name="news.author" id="author" cssClass="input inputShort"/>
            <label class="control-label text"> 标题:</label>
            <s:textfield name="news.title" id="title" cssClass="input"/>
        </div>

        <div class="newsLine">
            <label class="control-label text"> 时间:</label>
            <s:textfield name="news.pubTime" id="pubTime" cssClass="input inputShort Wdate" readonly="true" onClick="WdatePicker()">
                <s:param name="value" ><s:date name="news.pubTime" format="yyyy-MM-dd"/></s:param>
            </s:textfield>
            <label class="control-label text"> 来源:</label>
            <s:textfield name="news.pubOrg" id="pubOrg" cssClass="input"/>
        </div>

        <div class="newsLine">
            <label class="control-label text"> 类别:</label>
            <span class="caglists">
                <s:checkboxlist name="categoryIds" list="categories" listKey="id" listValue="name" cssClass="checkCategories"/>
            </span>
        </div>

        <div class="newsLine longtext">
            <label class="control-label text textLong"> 新闻正文内容:</label>
            <s:textarea rows="50" cols="50" name="news.content" class="longEditor"></s:textarea>
        </div>


    </div>

    <div style="clear: both;"></div>
    <div class="submitDiv">
        <button type="button" id="changeCompanyNewsBtn" class="btn btn-primary btn-success">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
        <span id="submit_msg_updateNews" style="color:red; font-weight: bold;font-size: 13px"></span>
    </div>

</s:form>
<script type="text/javascript">
    CKEDITOR.replace('news.content',
            {
                customConfig : '/jsp/layout/myCkeditor.js'
            }
    );
</script>
<%@ include file="news.js.jsp" %>