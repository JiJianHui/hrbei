<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-7
  Time: 下午8:56
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/css/register.css" rel="stylesheet" type="text/css" />

<div class="regLines">

    <form id="regForm" action="reg.html" method="post">

        <div class="regLine">
            <span class="text">昵称：</span>
            <input type="text" name="user.name" class="input"/>
            <span class="warning" id="warningName">*</span>
        </div>

        <div class="regLine">
            <span class="text">邮箱：</span>
            <input type="text" name="user.email" class="input"/>
            <span class="warning" id="warningEmail">*</span>
        </div>

        <div class="regLine">
            <span class="text">密码：</span>
            <input type="password" name="user.email" class="input"/>
            <span class="warning" id="warningPassword">*</span>
        </div>

        <div class="regLine">
            <span class="text">重复密码：</span>
            <input type="password" name="user.email" class="input"/>
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

    </form>

</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#btnclauses").click(function () {
            document.getElementById('regLicence').style.display='block';
            document.getElementById('fade').style.display='block';
        });
    });
</script>

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