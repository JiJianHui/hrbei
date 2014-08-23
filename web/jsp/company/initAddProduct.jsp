<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-21
  Time: 下午7:53
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="initAddProduct.js.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/company/addProduct.css"/>

<div class="stepBar">
    <a href="myCompany.html"> 我的公司</a>
    <span class="sepeator">></span>
    <a href="companyBlog.html?company.id=<s:property value='company.id'/>"><s:property value="company.name"/> </a>
    <span class="sepeator">></span>增加商品
</div>

<s:form id="productInfo" method="post" cssClass="form-horizontal" action="saveNewProduct">

<s:hidden name="company.id" id="company_id"/>

<div class="addProduct">

    <div class="productLine">
        <label class="control-label text"> 产品名称:</label>
        <s:textfield name="product.name" id="name" cssClass="input"/>
    </div>

    <div class="productLine">
        <label class="control-label text"> 产品品牌:</label>
        <s:textfield name="product.brand" id="brand" cssClass="input"/>
    </div>

    <div class="productLine">
        <label class="control-label text"> 产品型号:</label>
        <s:textfield name="product.xingHao" id="xingHao" cssClass="input"/>
    </div>

    <div class="productLine">
        <label class="control-label text"> 市场价:</label>
        <s:textfield name="product.price" id="price" cssClass="input inputShort"/>$

        <label class="control-label text"> 会员价:</label>
        <s:textfield name="product.vipPrice" id="vipPrice" cssClass="input inputShort"/>$

        <label class="control-label text"> 存货量:</label>
        <s:textfield name="product.quanty" id="quanty" cssClass="input inputShort"/>
    </div>

    <div class="productLine">
        <label class="control-label text"> 产品指标:</label>
        <s:textarea  rows="3" name="product.zhiBiao" id="zhiBiao" cssClass="input inputLong"/>
    </div>

    <div class="productLine">
        <label class="control-label text"> 描述:</label>
        <s:textarea rows="3" name="product.description" id="description" cssClass="input inputLong"/>
    </div>

    <div class="productLine">
        <label class="control-label text"> 状态:</label>
        <s:textfield name="product.status" id="status" cssClass="input"/>
    </div>

</div>

<div class="addProductPic">
    <div class="productLogo">
        <input type="hidden" id="picHidden" name="product.logo"/>
        <img src="/images/company/company_head2.jpg" id="productLogo"/>
        <br/>
        <a class="btn btn-success" id="change_product_portrait" href="productCrop.html?company.id=<s:property value='company.id'/>">更改Logo</a>
    </div>
</div>

<div style="clear: both;"></div>
<div class="submitDiv">
    <input type="submit" id="pubProduct" class="btn btn-primary btn-success" value="提交新的产品"/>
    <span id="submit_msg" style="color:red; font-weight: bold;font-size: 13px"></span>
</div>

</s:form>