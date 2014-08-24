<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-24
  Time: 下午2:26
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" type="text/css" href="/css/user/myCompany.css">

<div class="stepBar">
    <a href="myProducts.html"> 我的产品</a>
    <span class="sepeator">></span>商品列表
</div>


<div class="myCompanys">
    <s:iterator value="products">
        <div class="companyItem">

            <p class="companyLogo">
                <a href="productBlog.html?product.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <img src="<s:property value="logo"/>"/>
                </a>
            </p>

            <div class="infoWrap">
                <h4><a href="productBlog.html?product.id=<s:property value="id"/>"title="<s:property value="name"/>">
                    <s:property value="name"/></a><span class="date">2014-07-18</span>
                </h4>

                <p class="maintenance">
                    <span><strong>•</strong><span class="bar">销量:&nbsp;&nbsp;</span>156</span>
                    <span><strong>•</strong><span class="bar">评论:&nbsp;&nbsp;</span>200条</span>
                    <span><strong>•</strong><span class="bar">状态:&nbsp;&nbsp;</span>热销中</span>
                </p>

                <p class="details cf">
                    <span class="fl"><s:property value="description"/></span>
                </p>

                <p class="time">
                    <a class="manage_links" href="initUpdateProduct.html?product.id=<s:property value="id"/>">
                        更改信息</a>

                    <a class="manage_links" href="/deleteProduct.html?product.id=<s:property value="id"/>">
                        删除商品</a>
                </p>
            </div>

        </div>
    </s:iterator>

</div>

<tiles:insertTemplate template="/jsp/pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>
