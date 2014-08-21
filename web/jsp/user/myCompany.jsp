<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-14
  Time: 下午2:55
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link rel="stylesheet" type="text/css" href="/css/user/myCompany.css">

<div class="myCompanys">
    <s:iterator value="companys">
    <div class="companyItem">

        <p class="companyLogo">
            <a href="companyBlog.html?company.id=<s:property value="id"/>" title="<s:property value="name"/>">
                <img src="<s:property value="logo"/>"/>
            </a>
        </p>

        <div class="infoWrap">
            <h4><a href="companyBlog.html?course.id=<s:property value="id"/>"title="<s:property value="name"/>">
                <s:property value="name"/></a><span class="date">2014-07-18</span>
            </h4>

            <p class="maintenance">
                <span><strong>•</strong><span class="bar">产品:</span>200种</span>
                <span><strong>•</strong><span class="bar">销量:</span>156</span>
                <span><strong>•</strong><span class="bar">评论:</span>200条</span>
                <span><strong>•</strong><span class="bar">状态:</span>审核中</span>
            </p>

            <p class="details cf">
                <span class="fl"><s:property value="description"/></span>
            </p>

            <p class="time">
                <a class="manage_links" href="initUpdateCompany.html?company.id=<s:property value="id"/>">
                    基本信息</a>
                <a class="manage_links" href="/makeCourseVideo.html?course.id=<s:property value="id"/>">
                    公司商品</a>

                <a class="manage_links" href="/makeCourseVideo.html?course.id=<s:property value="id"/>">
                    增加商品</a>

                <a class="manage_links" href="/designGame.html?course.id=<s:property value="id"/>">
                    删除商店</a>
            </p>
        </div>

    </div>
    </s:iterator>
</div>