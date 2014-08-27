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

<div style="background-color: #08419c; border-bottom: 5px solid #08419c">
    <div class="companyBig"><img src="<s:property value="homeImage"/>"/></div>
    <div class="companyAd"><img src="<s:property value="adImage"/>"/></div>

    <div class="companyNews">
        <div class="title">公司新闻</div>
        <div class="news">
            <s:property value="newses">
                <div class="companyNew">
                    <a href="newsBlog.html?news.id=<s:property value="id"/>">
                        【<s:date name="pubTime" format="MM/dd/yyyy"/>】<s:property value="title"/>
                    </a>
                </div>
            </s:property>

        </div>
    </div>

    <div class="companyProductPriceTable">

        <div class="title">产品报价</div>
        <div class="briefPriceTable">
            <table class="priceTable">
                <tr class="head">
                    <th>产品</th><th>品牌</th>
                    <th>型号</th><th>指标</th>
                    <th>会员价</th><th>市场价</th><th>说明</th>
                </tr>

                <s:iterator value="products">
                    <tr>
                        <td><s:property value="name"/> </td><td><s:property value="brand"/></td>
                        <td><s:property value="xingHao"/></td><td><s:property value="zhiBiao"/></td>
                        <td><s:property value="vipPrice"/></td><td><s:property value="price"/></td>
                    </tr>
                </s:iterator>

            </table>
        </div>
    </div>

    <div class="companyHire">
        <div class="title">公司招聘</div>
        <div class="companyNews">
            <div class="companyNew"><a href="#">【招聘】急招网络编辑美工30名，工作经验者优先</a></div>
            <div class="companyNew"><a href="#">【招聘】招聘暑假兼职大学生若干，工资面议</a></div>
            <div class="companyNew"><a href="#">【招聘】急招挖掘机、推土机司机，奔赴西藏为西部大开发做贡献</a></div>
            <div class="companyNew"><a href="#">【招聘】急招网络编辑美工30名，工作经验者优先</a></div>
            <div class="companyNew"><a href="#">【招聘】招聘暑假兼职大学生若干，工资面议</a></div>
            <div class="companyNew"><a href="#">【招聘】急招挖掘机、推土机司机，奔赴西藏为西部大开发做贡献</a></div>
        </div>
    </div>

</div>
<div style="clear: both"></div>