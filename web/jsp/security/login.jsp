<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-21
  Time: 下午7:57
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>


<link href="/css/user/userLayout.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
    .loginLines{
        width: 400px;
        /*border: 1px solid blue;*/
        margin-left: 300px;
        margin-top: 50px;
        padding-left: 40px;
    }
</style>

<div class="loginLines">

    <%--<form id="loginForm" action="loginProcess.html" method="post">--%>
    <s:form validate="true" id="loginForm" theme="css_xhtml" cssClass="form-horizontal"  method="POST" action="loginProcess">
        <s:hidden name="reDirectUrl" id="reDirectUrl"/>

        <div class="updateLine">
            <span class="text">邮箱：</span><span class="warning warningNickName" id="warningEmail">*</span>

            <%--<input type="text" name="user.email" id="loginEmail" class="form-control input" placeholder="输入邮箱" />--%>
            <s:textfield name="user.email" id="loginEmail" cssClass="form-control input" placeholder="输入邮箱"/>
            <s:fielderror fieldName="user.email" />
        </div>

        <div class="updateLine">
            密码：<span class="old_password_msg input_msg" id="warningPassword">*</span>
            <%--<input type="password" class="form-control old_password input" id="loginPassword" placeholder="输入密码" name='user.password'>--%>
            <s:password name="user.password" id="loginPassword" cssClass="form-control input" placeholder="输入密码"/>
        </div>


        <div class="updateLine" style="margin-top: 25px; ">
            <input type="submit" class="btn btn-primary btn-success" id="lgbtn" value="登陆" onclick="return checkLoginForm()"/>
        </div>

    </s:form>

</div>

<script type="text/javascript">

    function checkLoginForm() {
        return checkLoginEmail() && checkLoginPwd();
    }

    function checkLoginEmail() {

        if ($("#loginEmail").attr('value') != "") {
            var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            var email = $("#loginEmail").val();
            if (!pattern.test(email)) {
                $("#warningEmail").text("电子邮件格式错误！");
                return false;
            }
        } else {
            $("#warningEmail").text("电子邮件不能为空！");
            return false;
        }
        $("#warningEmail").text("");
        return true;
    }

    function checkLoginPwd() {
        if ($("#loginPassword").val() == "") {
            $("#warningPassword").text("密码不能为空！");
            return false;
        }
        $("#warningPassword").text("");
        return true;
    }

</script>