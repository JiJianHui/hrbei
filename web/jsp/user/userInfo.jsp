<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-14
  Time: 下午2:59
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<div id="basicInfo">

    <form id="basicInfoForm" method="post" action="updateUserInfo">

        <div class="updateLine">
            <span class="text">昵称：</span><span class="warning warningNickName">*</span>
            <s:textfield type="text" name="user.nickName" id="nickName" cssClass="form-control input"/>
        </div>

        <div class="updateLine">
            <span class="text">邮箱：</span> <span class="warning" id="warningEmail">*</span>
            <input type="text" name="user.email" class="form-control input" value="<s:property value="user.email"/>" disabled/>
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

        <div class="updateLine">
            <button type="button" id="changeInfoBtn" class="btn btn-primary btn-success">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
            <span id="submit_msg" style="color:red; font-weight: bold;font-size: 13px"></span>
        </div>

    </form>

</div>

<div id="passAndLogo">

    <div class="changePortrait">
        <input type="hidden" id="picHidden"/>
        <img src="<s:property value='#session.userLogoUrl'/>" id="reImg"/>
        <br/>
        <a class="btn btn-success" id="change_portrait" href="userPortraitCrop.html">更改头像</a>
    </div>

    <div class="changePassword">
        <div class="updateLine">
            旧密码：<span class="old_password_msg input_msg"></span>
            <input type="password" class="form-control old_password input" id="pwd_old" onblur="checkOld()"
                   placeholder="输入旧密码" name='user.password'>
        </div>
        <div class="updateLine">
            新密码：
            <span class="new_password_msg input_msg"></span>
            <input type="password" class="form-control new_password input" id="pwd_new" onblur="checkNew()"
                   placeholder="输入新密码" name='newPassword'>
        </div>
        <div class="updateLine">
            确认密码：
            <span class="new_password_repeat_msg input_msg"></span>
            <input type="password" class="form-control new_password_repeat input" id="pwd_confirm" onblur="checkRepeat()"
                   placeholder="确认新密码" name='newPasswordConfirm'>

        </div>
        <div class="updateLine">
            <button type="button" class="btn btn-primary btn-success" id="chgPwdBtn">更改密码</button>
            <span style="color:red; font-weight: bold;" id="submit_msg1"></span>
            <span style="color:green; font-weight: bold;" id="submit_msg2"></span>
        </div>

    </div>
</div>

<script type="text/javascript">

    $("#nickName").blur(function () {
        checkNickName();
    });
    function checkNickName(){
        if( $("#nickName").attr('value').length > 100 ){
            $(".warningNickName").text("不能超过16字！");
            return false;
        }
        if( $("#nickName").attr('value').length == 0 ){
            $(".warningNickName").text("不能为空！");
            return false;
        }
        $(".warningNickName").text("*");
        return true;
    }

    $("#telphone").blur(function () {
        checkTelephone();
    });

    function checkTelephone(){
        if ($("#telphone").attr('value') == "") {
            $(".warningTelephone").text("手机号不能为空");
            return false;
        }
        if( $("#telphone").attr('value').length != 11 ){
            $(".warningTelephone").text("手机号码必须是11位！");
            return false;
        }
        $(".warningTelephone").text("");
        return true;
    }

    $("#description").blur(function () {
        checkDescription();}
    );

    function checkDescription(){
        if( $("#description").attr('value').length > 200 ){
            $(".warningDescription").text("不能超过200字！");
            return false;
        }
        $(".warningDescription").text("");
        return true;
    }

    function checkInfoForm(){
        if( !checkNickName() ) return false;
        if( !checkTelephone() ) return false;
        if( !checkDescription() ) return false;
        return true;
    }

    $("#changeInfoBtn").click(function(){
        if(!checkInfoForm()) return;

        var url="updateBasicInfo.html";
        var userData = $("#basicInfoForm").serialize();
        $.post(url,userData,function(data)
        {
            $("#submit_msg").html("");
            if(data.length != 0){$("#submit_msg").html("信息更改成功！");
            }else{$("#submit_msg").html("未知错误");}
        },"text");

    });


</script>

<script type="text/javascript">

    var password_empty = "密码是空的！";
    var old_new_repeat ="新密码和旧密码相同！";
    var new_repeat_differ = "两次输入的新密码不同！";
    var update_success =  "密码更新成功！！！";
    var update_old_wrong =  "旧密码输入错误";

    $(document).ready(function(){
        //更换头像
        $("#change_portrait").fancybox({
            type:'iframe',
            width:730,
            height:490,
            padding:10,
            scrolling:"no",
            modal:true
        });
    });

    function checkOld(){
        if($(".old_password").val() == ""){
            $(".old_password_msg").html(password_empty);
            return false;
        }

        $(".old_password_msg").html("");
        return true;
    }

    function checkNew(){
        var oldPassword = $(".old_password").val();
        var newPassword = $(".new_password").val();
        if(newPassword == ""){
            $(".new_password_msg").html(password_empty);
            return false;
        }

        if(oldPassword == newPassword){
            $(".new_password_msg").html(old_new_repeat);
            return false;
        }

        $(".new_password_msg").html("");
        return true;
    }
    function checkRepeat(){
        var newPasswordRepeat = $(".new_password_repeat").val();
        if(newPasswordRepeat == ""){
            $(".new_password_repeat_msg").html(password_empty);
            return false;
        }
        var newPassword = $(".new_password").val();
        if(newPassword != newPasswordRepeat){
            $(".new_password_repeat_msg").html(new_repeat_differ);
            return false;
        }

        $(".new_password_repeat_msg").html("");
        return true;
    }

    function checkPwdForm(){
        if(!checkOld()) return false;
        if(!checkNew()) return false;
        if(!checkRepeat()) return false;
        return true;
    }

    $("#chgPwdBtn").click(function(){
        if(!checkPwdForm()) return;

        var url="updatePassword.html";
        var params = {"user.password":$("#pwd_old").val(),"newPassword":$("#pwd_new").val()};
        $.post(url,params,function(data)
        {
            $("#submit_msg1").html("");
            $("#submit_msg2").html("");
            if(data.length != 0){$("#submit_msg2").html("密码更改成功！");
            }else{$("#submit_msg1").html("旧密码错误！");}
        },"text");

        $(".old_password").val("");
        $(".new_password").val("");
        $(".new_password_repeat").val("");
    });

</script>