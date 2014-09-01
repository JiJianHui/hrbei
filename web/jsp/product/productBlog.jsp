<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-31
  Time: 下午8:51
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<div class="productBlog" style="margin-left: 20px;margin-top: 20px;">
    <div class="productLoog">
        <img src="<s:property value="product.logo"/>"/>
    </div>
    <div class="productBlogInfo">

        <div class="productBlogLine">
            <span class="title"> 名称：</span><s:property value="product.name"/><br/></div>
        <div class="productBlogLine">
            <span class="title">品牌：</span><s:property value="product.brand"/><br/></div>
        <div class="productBlogLine">
            <span class="title">型号：</span><s:property value="product.xingHao"/><br/></div>
        <div class="productBlogLine">
            <span class="title">市场价：</span><s:property value="product.price"/>
            <span class="title">会员价：</span><s:property value="product.vipPrice"/>
        </div>
        <div class="productBlogLine">
            <span class="title">指标：</span><s:property value="product.zhiBiao"/><br/></div>
        <div class="productBlogLine">
            <span class="title">介绍：</span><s:property value="product.description"/><br/></div>
    </div>
</div>

<style>

    .productBlog{
        font-family: Tahoma, Geneva,"\5FAE\8F6F\96C5\9ED1","\5b8b\4f53",sans-serif;
    }
    .productLoog{
        float: left;
        width: 200px;
    }
    .productLoog img{
        width: 200px;
        height: 200px;
    }
    .productBlogInfo{
        float: left;
        margin-left: 10px;;
        width: 750px;
    }

    .productBlogLine{
        line-height: 20px;
        margin-bottom: 8px;;
    }

    .title{
        font-weight: bold;
        color: #5cb85c;
    }
</style>