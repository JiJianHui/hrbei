<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-31
  Time: 下午2:44
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link href="/css/category.css" rel="stylesheet" type="text/css" />

<div class="companyProducts">

    <s:if test="menu.equals('product')">
        <s:iterator value="products" status="st">

            <s:if test="#st.index%2 == 0">
                <div class="lines">
            </s:if>

            <div class="item">
                <div class="itemImage">
                    <img class="itemImg" src="<s:property value="logo"/>" alt="title" id="<s:property value="id"/>">
                </div>

                <div class="itemInfo">
                    <span class="infoTitle">名称：</span><s:property value="name"/><br/>
                    <span class="infoTitle">品牌：</span><s:property value="brand"/><br/>
                    <div class="textLong"><span class="infoTitle">介绍：</span><s:property value="description"/></div>
                </div>
            </div>

            <s:if test="#st.index%3==1 || #st.last">
                </div>
            </s:if>

        </s:iterator>

        <s:if test="products.size()==0">
            <div style="font-size: 15px;">对不起，暂时没有对应的产品。</div>
        </s:if>

    </s:if>

    <s:if test="menu.equals('news')">
        <div class="news" style="min-height: 200px;">
            <s:iterator value="newses">
                <a href="newsBlog.html?news.id=<s:property value="id"/>">
                [<s:property value="getFirstCategoryName()"/>]&nbsp;
                <s:property value="title"/>&nbsp;[<s:property value="pubOrg"/>&nbsp;<s:date name="pubTime" format="yyyy-MM-dd"/>]
                </a>
            </s:iterator>

            <s:if test="newses.size()==0">
                <div style="font-size: 15px;">对不起，该商店暂时没有发布新闻。</div>
            </s:if>
        </div>
    </s:if>

    <s:if test="menu.equals('about')">
        <div class="aboutCompany" style="margin-top: 20px;letter-spacing: 2px;">

            <div><span class="companyName">名&nbsp;&nbsp;&nbsp;称:</span>&nbsp;&nbsp;&nbsp;<s:property value="company.name"/></div>
            <div><span class="companyName">联系人:</span>&nbsp;&nbsp;&nbsp;<s:property value="company.contactName"/></div>
            <div><span class="companyName">固&nbsp;&nbsp;&nbsp;话:</span>&nbsp;&nbsp;&nbsp;<s:property value="company.phone"/></div>
            <div><span class="companyName">手&nbsp;&nbsp;&nbsp;机:</span>&nbsp;&nbsp;&nbsp;<s:property value="company.mobilePhone"/></div>
            <div><span class="companyName">邮&nbsp;&nbsp;&nbsp;箱:</span>&nbsp;&nbsp;&nbsp;<s:property value="company.email"/></div>
            <div><span class="companyName">地&nbsp;&nbsp;&nbsp;址:</span>&nbsp;&nbsp;&nbsp;<s:property value="company.address"/></div>

            <div style="margin-top: 15px">
                <span class="companyName">公司介绍:</span><br/>
                <s:property value="company.description" escape="false"/>
            </div>

        </div>
    </s:if>

    <s:if test="menu.equals('hire')">
        <div class="news" style="min-height: 200px;">
            <s:iterator value="newses">
                <a href="newsBlog.html?news.id=<s:property value="id"/>">
                    [<s:property value="getFirstCategoryName()"/>]&nbsp;
                    <s:property value="title"/>&nbsp;[<s:property value="pubOrg"/>&nbsp;<s:date name="pubTime" format="yyyy-MM-dd"/>]
                </a>
            </s:iterator>

            <s:if test="newses.size()==0">
                <div style="font-size: 15px;">该商店暂时没有发布招聘新闻。</div>
            </s:if>
        </div>
    </s:if>

    <s:if test="!menu.equals('about')">
        <s:form id="postPageForm" action="companyBlogContents">
            <s:hidden name="company.id"/>
            <s:hidden name="menu"/>
            <tiles:insertTemplate template="/jsp/paginationPost.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>
        </s:form>
    </s:if>
</div>