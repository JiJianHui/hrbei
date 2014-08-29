<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-14
  Time: 上午9:26
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% request.setCharacterEncoding("UTF-8"); %>

<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<%--<script type="text/javascript" src="js/dialog.js"></script>--%>
<script type="text/javascript" src="js/bootstrap-modal.js"></script>
<script type="text/javascript" src="js/bootstrap-transition.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery1.83.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js"></script>

<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>

<link href="js/uploadify/uploadify.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>



<%--登录ajax处理代码--%>
<script type="text/javascript">

    window.onload=function(){

    $("#log_btn").click(function ()
    {
        if (checkForm()) {
            var userData = $("#user_login_form").serialize();
            $.post("ajaxLogin.html", userData, function (data) {
                handlePostResult(data);
            });
        }
    });

    function checkForm() {

        return checkEmail() && checkPwd();
    }

    function checkEmail() {
        $("#login_tip").text("");
        if ($("#inputEmail").attr('value') != "") {
            var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            var email = $("#inputEmail").val();
            if (!pattern.test(email)) {
                $("#login_tip").text("电子邮件格式错误！");
                return false;
            }
        } else {
            $("#login_tip").text("电子邮件不能为空！");
            return false;
        }

        return true;
    }

    function checkPwd() {
        if ($("#inputPassword").val() == "") {
            $("#login_tip").text("密码不能为空！");
            return false;
        }
        return true;
    }

    function handlePostResult(data) {
        if (data == "success") {
            var currHref = window.location.href;
            if (currHref.substring(currHref.lastIndexOf('/')) == '/exitSystem.html') {
                currHref = currHref.substring(0, currHref.lastIndexOf('/') + 1);
            }
            var extension = currHref.substring( currHref.lastIndexOf("/") );
            if (currHref.indexOf("index.html") > -1 || extension=="/" || extension =="#" ) {
                window.location.href = "myfirstPage.html";
                return;
            }

            window.location.reload();
        } else {
            $("#login_tip").text(data);
        }
    }

}

</script>