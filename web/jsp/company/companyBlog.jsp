<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-7
  Time: 下午11:37
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link href="/css/category.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/css/jcarousel.connected-carousels.css">

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.jcarousel.min.js"></script>

<script type="text/javascript" src="/js/jcarousel.connected-carousels.js"></script>

<style>

    pre {
        border:1px solid #000;
        overflow-x:auto;
        background: #222;
        color: #fff;
        text-shadow: none;
    }

    .wrapper {
        max-width: 1024px;
        /*padding: 0 20px 40px 20px;*/
        padding: 0px;;
        margin: auto;
    }
</style>


<div style="background-color: #08419c; border-bottom: 5px solid #08419c">
    <div class="companyBig"><img src="<s:property value="company.homeImage"/>"/></div>
    <%--<div class="companyAd"><img src="<s:property value="company.adImage"/>"/></div>--%>

    <div class="companyAd">

        <div class="wrapper">
            <div class="connected-carousels">

                <div class="stage">
                    <div class="carousel carousel-stage">
                        <ul style="display: block">
                            <s:iterator value="adImages" id="adImage">
                                <li><img src="<s:property value="#adImage"/>" width="1020" height="400" alt=""></li>
                            </s:iterator>
                        </ul>
                    </div>
                    <a href="#" class="prev prev-stage"><span>&lsaquo;</span></a>
                    <a href="#" class="next next-stage"><span>&rsaquo;</span></a>
                </div>

                <div class="navigation">
                    <a href="#" class="prev prev-navigation">&lsaquo;</a>
                    <a href="#" class="next next-navigation">&rsaquo;</a>
                    <div class="carousel carousel-navigation">
                        <ul style="display: block;">
                            <s:iterator value="adImages" id="adImageSmall">
                                <li><img src="<s:property value="#adImageSmall"/>" width="50" height="50" alt=""></li>
                            </s:iterator>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <div class="companyNews">
        <div class="title">公司新闻</div>
        <div class="news" style="min-height: 200px;">

            <s:iterator value="newses">
                <div class="companyNew" style="margin-left: 6px;"><a href="newsBlog.html?news.id=<s:property value="id"/>">
                    【<s:property value="getFirstCategoryName()"/>】
                    <s:property value="title"/>&nbsp;[<s:property value="pubOrg"/>&nbsp;<s:date name="pubTime" format="yyyy-MM-dd"/>]
                </a></div>
            </s:iterator>
        </div>
    </div>

    <div class="companyProductPriceTable">

        <div class="title">产品报价</div>
        <div class="briefPriceTable">
            <table class="priceTable" style="margin-bottom: 30px;">
                <tr class="head">
                    <th>产品</th><th>品牌</th>
                    <th>型号</th><th>指标</th>
                    <th>会员价</th><th>市场价</th><th>说明</th>
                </tr>


                <s:iterator value="products">
                    <tr>
                        <td class="tdNormal">
                            <a href="productBlog.html?product.id=<s:property value="id"/>"><s:property value="name"/></a>
                        </td>
                        <td class="tdNormal tdCenter"><s:property value="brand"/> </td>
                        <td class="tdNormal"><s:property value="xingHao"/> </td>
                        <td class="tdLong"><s:property value="zhiBiao"/> </td>
                        <td class="tdShort"><s:property value="vipPrice"/> </td>
                        <td class="tdShort"><s:property value="price"/> </td>
                    </tr>
                </s:iterator>

            </table>
        </div>
    </div>

    <div class="companyHire">
        <div class="title">公司招聘</div>
        <div class="companyNews" style="min-height: 200px;">
            <s:iterator value="newses">
                <div class="companyNew" style="margin-left: 6px;"><a href="newsBlog.html?news.id=<s:property value="id"/>">
                    【<s:property value="getFirstCategoryName()"/>】
                    <s:property value="title"/>&nbsp;[<s:property value="pubOrg"/>&nbsp;<s:date name="pubTime" format="yyyy-MM-dd"/>]
                </a></div>
            </s:iterator>
        </div>
    </div>

</div>
<div style="clear: both"></div>