<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-25
  Time: 下午10:02
  Email: jhji@ir.hit.edu.cn
--%>
<script type="text/javascript">

//    $("#regInfoBtn").click(function(){
//        if(!checkInfoForm()) return;
//
//        var url="reg.html";
//        var userData = $("#regBasicInforForm").serialize();
//        $.post(url,userData,function(data)
//        {
//            $("#submit_msg").html("");
//            if(data.length != 0){$("#submit_msg").html("注册成功！");
//            }else{$("#submit_msg").html("未知错误");}
//        },"text");
//
//    });

    function checkRegInfoForm(){
        if( !checkRegNickName() ) return false;
        if( !checkRegEmail() ) return false;
        if( !checkRegPass() ) return false;
        if( !checkRepeat()) return false;
        if( !checkTelephone() ) return false;
        if( !checkDescription() ) return false;
        if( !checkRegLogo() ) return false;

        return true;
    }

    $("#regNickName").blur(function () {
        checkRegNickName();
    });

    $("#regEmail").blur(function () {
        checkRegEmail();
    });


    $("#regPasssword").blur(function () {
        checkRegPass()
    });

    $("#regPasssword").blur(function () {
        checkRegPass()
    });

    $("#pwd_confirm").blur(function () {
        checkRepeat();
    });


    $("#description").blur(function () {
                checkDescription();}
    );


    function checkRegNickName(){
        if( $("#regNickName").attr('value').length > 100 ){
            $(".warningNickName").text("不能超过16字！");
            return false;
        }
        if( $("#regNickName").attr('value').length == 0 ){
            $(".warningNickName").text("不能为空！");
            return false;
        }
        $(".warningNickName").text("*");
        return true;
    }

    function checkRegEmail() {

        if ($("#regEmail").attr('value') != "") {
            var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            var email = $("#regEmail").val();
            if (!pattern.test(email)) {
                $(".warningEmail").text("电子邮件格式错误！");
                return false;
            }
        } else {
            $(".warningEmail").text("电子邮件不能为空！");
            return false;
        }
        $(".warningEmail").text("*");
        return true;
    }


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


    function checkDescription(){
        if( $("#description").attr('value').length > 200 ){
            $(".warningDescription").text("不能超过200字！");
            return false;
        }
        $(".warningDescription").text("");
        return true;
    }

    function checkRegPass(){
        if($("#regPassword").val() == ""){
            $(".warningPassword").html(password_empty);
            return false;
        }

        $(".warningPassword").html("");
        return true;
    }


    function checkRepeat(){
        var newPasswordRepeat = $("#pwd_confirm").val();
        if(newPasswordRepeat == ""){
            $(".warningRepeatPassword").html(password_empty);
            return false;
        }
        var newPassword = $("#regPassword").val();
        if(newPassword != newPasswordRepeat){
            $(".warningRepeatPassword").html(new_repeat_differ);
            return false;
        }

        $(".warningRepeatPassword").html("");
        return true;
    }

    function checkRegLogo(){

        if( $("#picHidden").val().length == 0 ){

            $(".warningLogo").html("请上传头像！");

            return false;
        }

        $(".warningLogo").html("");

        return true;
    }

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

</script>