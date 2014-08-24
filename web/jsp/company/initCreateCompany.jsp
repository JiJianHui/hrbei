<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-14
  Time: 下午9:40
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="initCreateCompany.js.jsp" %>

<link rel="stylesheet" type="text/css" href="/css/company/createCompany.css"/>

<s:form id="companyBasicInfo" method="post" cssClass="form-horizontal" action="saveCompany">

<div class="companyInfo">

    <div class="basicInfo">

        <div class="companyLines">
            <label class="control-label text"> 公司名称:</label>
            <%--<span class="errorinfo" id="yzName"></span>--%>
            <s:textfield name="company.name" id="name" cssClass="input"/>
        </div>

        <div class="companyLines">
            <label class="control-label text">公司地址:</label>
            <%--<span class="errorinfo" id="yzemail"></span>--%>
            <s:textarea name="company.address" rows="2"  id="address" cssClass="inputLong"/>
        </div>

    <%--</div>--%>

    <%--<div class="companyNum">--%>

        <div class="companyLines">
            <label class="control-label text">联&nbsp;系&nbsp;人:</label>
            <s:textfield type="text" name="company.contactName" id="contactName" cssClass="input inputShort"/>
            <label class="control-label text">公司QQ:</label>
            <s:textfield type="text" name="company.qq" id="qq" cssClass="input inputShort"/>
        </div>

        <div class="companyLines">
            <label class="control-label text">公司固话:</label>
            <s:textfield type="text" name="company.phone" id="phone" cssClass="input inputShort"/>
            <label class="control-label text">移动电话:</label>
            <s:textfield type="text" name="company.mobilePhone" id="mobilePhone" cssClass="input inputShort"/>
        </div>

        <div class="companyLines">
            <label class="control-label text">公司Email:</label>
            <s:textfield type="text" name="company.email" id="email" cssClass="input inputShort"/>
            <label class="control-label text">公司网址:</label>
            <s:textfield type="text" name="company.webSite" id="webSite" cssClass="input inputShort"/>
        </div>

        <%--<div class="companyLines">--%>
            <%--<button type="button" class="btn btn-primary btn-success" style="margin-left: 20px;" id="chgPwdBtn">提交商店基本信息</button>--%>
            <%--<span style="color:red; font-weight: bold;" id="submit_msg1"></span>--%>
            <%--<span style="color:green; font-weight: bold;" id="submit_msg2"></span>--%>
        <%--</div>--%>

        <div class="companyLines">
            <label class="control-label text">公司简介:</label>
                <%--<span class="errorinfo" id="yzemail"></span>--%>
            <s:textarea name="company.description" rows="4"  id="description" cssClass="inputLong"/>
        </div>

    </div>


</div>

<div class="companyPics">
    <div class="companyLogo">
        <div class="picTips">1:在线商铺的商标Logo图像。(160*100)</div>
        <img src="/images/company/company_head2.jpg" id="logoImg"/>
        <%--<a class="btn btn-success" id="change_portrait" href="#">更改</a>--%>
        <br/>
        <input type="file" name="fileupload" id="change_logo" class="fileInput"/>
        <p id="warning1" class="input_msg"></P>
        <s:hidden name="company.logo" id="logoURL"/>
        <div id="fileQueue"></div>
    </div>


    <div class="companyHomePic">
        <div class="picTips">2:在线商铺主页上的图片介绍(1024*340)</div>
        <img src="/images/company/companyDefaultHead.png" id="homeImage"/>
        <%--<a class="btn btn-success" id="change_profile" href="userPortraitCrop.html">更改</a>--%>
        <input type="file" name="fileupload" id="change_profile" class="fileInput"/>
        <p id="warning2" class="input_msg"></P>
        <s:hidden name="company.homeImage" id="homeImgURL"/>
        <div id="fileQueueProfile"></div>
    </div>

    <div class="companyBigAd">
        <div class="picTips">3:在线商铺主页上的图片广告(1024*430)</div>
        <img src="/images/company/company_head2.jpg" id="adImage"/>
        <%--<a class="btn btn-success" id="change_ad" href="userPortraitCrop.html">更改</a>--%>
        <input type="file" name="fileupload" id="change_AD" class="fileInput"/>
        <p id="warning3" class="input_msg"></P>
        <s:hidden name="company.adImage" id="adImgURL"/>
        <div id="fileQueueAD"></div>
    </div>
</div>

<div class="companyLines" style="width: 100%; text-align: center">
    <input type="submit" class="btn btn-primary btn-success" style=""
           id="submitCompany" value="提交创建的商店" onclick="return checkCompanyForm()"/>
    <span style="color:red; font-weight: bold;" id="submit_msg1"></span>
    <span style="color:green; font-weight: bold;" id="submit_msg2"></span>
</div>

</s:form>

<script type="text/javascript">

    function checkCompanyForm(){
        return true;
    }


</script>