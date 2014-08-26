<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-7
  Time: 下午8:56
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link href="/css/register.css" rel="stylesheet" type="text/css" />
<link href="/css/user/userLayout.css" rel="stylesheet" type="text/css" />

<%--<s:form id="basicInfoForm" method="post" action="updateUserInfo">--%>

<%--<s:form id="regBasicInforForm" method="post" cssClass="form-horizontal" action="reg" validate="true">--%>
<s:form validate="true" id="regBasicInforForm" theme="css_xhtml" cssClass="form-horizontal"  method="POST" action="reg">
<div class="regContent">

    <div id="basicInfo" class="basicInfo">

        <div class="updateLine">
            <span class="text">昵称：</span><span class="warning warningNickName">*</span>
            <s:textfield type="text" name="user.nickName" id="regNickName" cssClass="form-control input"/>
        </div>

        <div class="updateLine">
            <span class="text">邮箱：</span> <span class="warning warningEmail">*</span>
            <s:textfield name="user.email" id="regEmail" cssClass="form-control input"/>
        </div>

        <div class="updateLine">
            <span class="text">密码：</span> <span class="warning warningPassword">*</span>
            <s:password  cssClass="form-control new_password input" id="regPassword"
                   placeholder="输入新密码" name='user.password'/>
        </div>
        <div class="updateLine">
            <span class="text"> 确认密码：</span> <span class="warning warningRepeatPassword">*</span>
            <s:password type="password" cssClass="form-control new_password_repeat input" id="pwd_confirm"
                   placeholder="确认新密码" name='repeatPassword'/>

        </div>

        <div class="updateLine">

            <span class="text">性别：</span>

            <label>
                <input type="radio" name="user.sexy" value="true" <s:if test="user.sexy">checked="checked"</s:if> >
                <span>男</span>
            </label>

            <label>
                <input type="radio" name="user.sexy" value="false" <s:if test="!user.sexy">checked="checked"</s:if> >
                <span>女</span>
            </label>

        </div>

        <div class="updateLine">
            <span class="text">电话：</span><span class="warning warningTelephone"></span>
            <s:textfield type="text" name="user.mobilePhone" cssClass="form-control input" id="telphone"/>
        </div>

        <div class="updateLine">
            <span class="text">自我介绍：</span><span class="warning warningDescription"></span>
            <s:textarea type="text" name="user.description" id="description" cssClass="form-control input" rows="3"/>
        </div>

        <div class="regLine" style="margin-top: 20px;">
            <input type="checkbox" name="log" checked="checked" id="licenceCheckBox" class="loginCheck" />
            <span><a href="#" class="regLicenceLink" id="btnclauses">我已阅读、理解并接受网站用户注册相关条款</a></span>
            <span class="warning" id="warningLicence"></span>
        </div>

        <div class="updateLine">
            <input type="submit" id="regInfoBtn" class="btn btn-primary btn-success" style="font-weight: bold;" onclick="return checkRegInfoForm();" value="注册"/>
                <%--&nbsp;&nbsp;注&nbsp;&nbsp;册&nbsp;&nbsp;</button>--%>
            <span id="submit_msg" style="color:red; font-weight: bold;font-size: 13px"></span>
        </div>

</div>

    <div id="passAndLogo" class="passAndLogo">

        <div class="changePortrait">
            <input type="hidden" id="picHidden" name="user.logo"/>
            <img src="<s:property value='#session.userLogoUrl'/>" id="productLogo"/>
            <br/>
            <a class="btn btn-success" id="change_portrait" href="userRegImgCrop.html">上传头像</a>
            <br/><span class="warning warningLogo"></span>
        </div>

    </div>

    <div style="clear: both;"></div>
</div>

</s:form>

<%--
<div class="regLines">

    <s:form validate="true" id="regForm" theme="css_xhtml" cssClass="form-horizontal"  method="POST" action="reg">

        <div class="regLine">
            <span class="text">昵称：</span>
            <input type="text" name="user.name" id="name" class="input"/>
            <span class="warning" id="warningName">*</span>
        </div>

        <div class="regLine">
            <span class="text">邮箱：</span>
            <input type="text" name="user.email" id="email" class="input"/>
            <span class="warning" id="warningEmail">*</span>
        </div>

        <div class="regLine">
            <span class="text">密码：</span>
            <input type="password" name="user.password" id="password" class="input"/>
            <span class="warning" id="warningPassword">*</span>
        </div>

        <div class="regLine">
            <span class="text">重复密码：</span>
            <input type="password" name="repeatPassword" id="repeatPassword" class="input"/>
            <span class="warning" id="warningPassword2">*</span>
        </div>

        <div class="regLine">
            <input type="checkbox" name="log" checked="checked" id="licenceCheckBox" class="loginCheck" />
            <span><a href="#" class="regLicenceLink" id="btnclauses">我已阅读、理解并接受网站用户注册相关条款</a></span>
            <span class="warning" id="warningLicence"></span>
        </div>

        <div class="regLine regSubmit">
            <button type="button" id="reg_btn" class="regButton">注&nbsp;册</button>
        </div>

    </s:form>

</div>

--%>

<script type="text/javascript">
    $(document).ready(function () {
        $("#btnclauses").click(function () {
            document.getElementById('regLicence').style.display='block';
            document.getElementById('fade').style.display='block';
        });
    });
</script>

<%@ include file="register.js.jsp" %>

<div id="regLicence" class="regLicence">

    <div class="licenceHead">
        <div class="licenceHeadLeft">■服务协议</div>
        <div class="licenceHeadRight">
            <a href="javascript:void(0)" onclick="document.getElementById('regLicence').style.display='none';document.getElementById('fade').style.display='none'">
                <%--<img src="/images/close.png"/>--%>[Close]
            </a>
        </div>
    </div>

    <div class="licenceContent">

        <div class="licenceItem">
            1.本网站的所有权和经营权归哈尔滨电子企业报价网有限公司所有。哈尔滨电子企业报价网有限公司按照本服务协议的规定，为在本网站注册的会员提供商品介绍、信息咨询、商品销售等服务。
        </div>
        <div class="licenceItem">
            2.会员在本网站注册时应当先仔细阅读本服务协议的所有条款，在同意全部条款内容的基础上完成注册手续。会员一旦完成注册手续，即视作 与哈尔滨电子企业报价网商贸有限公司签订了本服务协议。
        </div>

        <div class="licenceItem">
            3.哈尔滨电子企业报价网商贸有限公司可以合法拥有和保管会员中的注册信息及会员接受服务过程中提供的所有信息资料。
        </div>

        <div class="licenceItem">
            4.会员在注册时应提供真实、详细、准确的个人资料进行注册。注册ID以及密码只能由本人使用，不得转借给他人使用，违者后果自负。
        </div>

        <div class="licenceItem">
            5.当会员姓名、地址、电子邮箱等信息发生变更时，必须及时进行更新。由于会员未及时更新个人信息而造成本网站或哈尔滨电子企业报价网商贸有限公司服务发生问题的，由会员自行承担责任。
        </div>
    </div>
</div>