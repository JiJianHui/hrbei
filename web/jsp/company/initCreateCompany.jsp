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

<div class="stepBar">
    <a href="userCenter.html"> 个人中心</a>
    <span class="sepeator">></span>创建公司
</div>

<s:form id="companyBasicInfo" method="post" cssClass="form-horizontal" action="saveCompany">

    <div class="companyInfo">
        <label class="h3_title" style="margin-bottom: 20px;margin-top: 10px;">第一步：公司基本信息</label>
        <div class="basicInfo">

            <div class="companyLines">
                <label class="control-label text"> 公司名称:</label>
                <s:textfield name="company.name" id="name" cssClass="input"/>
            </div>

            <div class="companyLines">
                <label class="control-label text">公司地址:</label>
                <s:textarea name="company.address" rows="2"  id="address" cssClass="inputLong"/>
            </div>

            <div class="companyLines">
                <label class="control-label text">公司网址：</label>
                <s:textfield type="text" name="company.webSite" id="webSite" cssClass="input inputShort"/>
                <label class="control-label text">联&nbsp;系&nbsp;人:</label>
                <s:textfield type="text" name="company.contactName" id="contactName" cssClass="input inputShort"/>
                <label class="control-label text">公司QQ:</label>
                <s:textfield type="text" name="company.qq" id="qq" cssClass="input inputShort"/>
            </div>

            <div class="companyLines">
                <label class="control-label text">公司固话:</label>
                <s:textfield type="text" name="company.phone" id="phone" cssClass="input inputShort"/>
                <label class="control-label text">移动电话：</label>
                <s:textfield type="text" name="company.mobilePhone" id="mobilePhone" cssClass="input inputShort"/>

                <label class="control-label text">公司Email:</label>
                <s:textfield type="text" name="company.email" id="email" cssClass="input inputShort"/>
            </div>

            <div class="companyLines" style="font-weight: normal;">
                <label class="control-label text"> 类别:</label>
                <span class="caglists">
                    <s:checkboxlist name="categoryIds" list="categories" listKey="id" listValue="name"/>
                </span>
            </div>

            <div class="companyLines">
                <label class="control-label text">公司简介:</label>
                    <%--<s:textarea name="company.description" rows="3"  id="description" cssClass="inputLong"/>--%>
                <s:textarea rows="20" cols="20" name="company.description" cssClass="longEditor" id="description"></s:textarea>
            </div>

        </div>


    </div>

    <div class="companyPics">

        <label class="h3_title" style="margin-bottom: 20px;margin-top: 10px;">第二步：公司图片</label>

        <div class="companyLogo">
            <div class="picTips">1:在线商铺的商标Logo图像<span class="errorinfo">(160*100)</span></div>
            <img src="<s:property value="company.logo"/>" id="logoImg"/>
                <%--<a class="btn btn-success" id="change_portrait" href="#">更改</a>--%>
            </br>
            <input type="file" name="fileupload" id="change_logo" class="fileInput"/>
            <p id="warning1" class="input_msg"></P>
            <s:hidden name="company.logo" id="logoURL"/>
            <div id="fileQueue"></div>
        </div>


        <div class="companyHomePic">
            <div class="picTips">2:在线商铺主页上的图片介绍<span class="errorinfo">(宽必须是1024*最高340)</span></div>
            <img src="<s:property value="company.homeImage"/>" id="homeImage"/>
                <%--<a class="btn btn-success" id="change_profile" href="userPortraitCrop.html">更改</a>--%>
            <br/>
            <input type="file" name="fileupload" id="change_profile" class="fileInput"/>
            <p id="warning2" class="input_msg"></P>
            <s:hidden name="company.homeImage" id="homeImgURL"/>
            <div id="fileQueueProfile"></div>
        </div>

        <div class="companyBigAd">
            <div class="picTips">3:在线商铺主页上的图片广告<span class="errorinfo">(宽度必须是1024，高度最高500)</span></div>
            <div id="tabtag_4con">
                <table id="imageTable">
                    <tr>
                        <td class="imageCol">预览</td><td class="desCol">类型</td><td class="pathCol">路径</td><td class="editCol">操作</td>
                    </tr>

                        <%--广告照片--%>
                    <s:iterator value="adImages" id="adImage">
                        <tr>
                            <td class="imageCol"><img src="<s:property value="#adImage"/>"/></td>
                            <td class="desCol">广告照片</td>
                            <td class="pathCol"><input name="adImages" value="<s:property value='#adImage'/>"/></td>
                            <td class="editCol"><img src='/images/delete.jpg' class='newImage' ></td>
                        </tr>
                    </s:iterator>

                </table>
                <div>
                    <input type="file" name="fileupload" id="change_AD" class="fileInput"/>
                    <s:hidden id="adImage" /><s:hidden id="adImgURL" />
                    <div id="fileQueueAD"></div>
                </div>
            </div>
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

    CKEDITOR.replace('company.description',
            {
                customConfig : '/jsp/layout/myCkeditor.js'
            }

    );

    function checkCompanyForm(){
        return true;
    }


</script>