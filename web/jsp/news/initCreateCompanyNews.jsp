<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-24
  Time: 下午8:08
  Email: jhji@ir.hit.edu.cn
--%>
<link rel="stylesheet" type="text/css" href="/css/news/news.css"/>

<a href="myCompany.html"> 我的公司</a>
<span class="sepeator">></span>
<a href="companyBlog.html?company.id=<s:property value='company.id'/>"><s:property value="company.name"/> </a>
<span class="sepeator">></span>
<a href="initCreateCompanyNews.html"> 发布新闻</a>

<s:form id="newNewsInfoForm" method="post" cssClass="form-horizontal" action="saveCompanyNews">
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
            <label class="control-label text textLong"> 请输入新闻内容:</label>
            <textarea rows="50" cols="50" name="news.content" class="longEditor"></textarea>
        </div>


    </div>

    <div style="clear: both;"></div>
    <div class="submitDiv">
        <input type="submit" id="pubProduct" class="btn btn-primary btn-success" value="发布该新闻" onclick="return checkNewsForm()"/>
        <span id="submit_msg_updateNews" style="color:red; font-weight: bold;font-size: 13px"></span>
    </div>

</s:form>

<%@ include file="news.js.jsp" %>