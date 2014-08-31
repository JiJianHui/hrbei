<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-8
  Time: 上午12:23
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>

    <div class="companyDisplay">
        <div class="displayLogo"><img src="<s:property value="company.logo"/>"/></div>
        <div class="companyDisplayName">
            <s:property value="company.name"/>
        </div>
        <div class="companyDisplayService">
            <a href="#"><img src="/images/company/shoucang.jpg"/></a>
            <a href="#"><img src="/images/company/zhengpin.jpg"/></a>
            <a href="#"><img src="/images/company/fapiao.jpg"/></a>
        </div>
    </div>

    <div class="companyMenus">
        <div class="companyMenu"><a href="companyBlog.html?company.id=<s:property value="company.id"/>">首页</a></div>
        <div class="companyMenu"><a href="companyBlogContents.html?company.id=<s:property value="company.id"/>&menu=product">本店所售商品</a></div>
        <div class="companyMenu"><a href="companyBlogContents.html?company.id=<s:property value="company.id"/>&menu=news">公司新闻</a></div>
        <div class="companyMenu"><a href="companyBlogContents.html?company.id=<s:property value="company.id"/>&menu=hire">招聘信息</a></div>
        <div class="companyMenu"><a href="companyBlogContents.html?company.id=<s:property value="company.id"/>&menu=about">企业介绍</a></div>
        <div class="companyMenu"><a href="#">收藏本店</a></div>
    </div>

</div>