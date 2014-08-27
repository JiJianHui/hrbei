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


<script language="javascript" type="text/javascript">
    var s=function(){
        var interv=2000; //切换间隔时间
        var interv2=10; //切换速速
        var opac1=80; //文字背景的透明度
        var source="fade_focus" //图片容器id
        //获取对象
        function getTag(tag,obj){if(obj==null){return document.getElementsByTagName(tag)}else{return obj.getElementsByTagName(tag)}}
        function getid(id){return document.getElementById(id)};
        var opac=0,j=0,t=63,num,scton=0,timer,timer2,timer3;var id=getid(source);id.removeChild(getTag("div",id)[0]);var li=getTag("li",id);var div=document.createElement("div");var title=document.createElement("div");var span=document.createElement("span");var button=document.createElement("div");button.className="button";for(var i=0;i<li.length;i++){var a=document.createElement("a");a.innerHTML=i+1;a.onclick=function(){clearTimeout(timer);clearTimeout(timer2);clearTimeout(timer3);j=parseInt(this.innerHTML)-1;scton=0;t=63;opac=0;fadeon();};a.className="b1";a.onmouseover=function(){this.className="b2"};a.onmouseout=function(){this.className="b1";sc(j)};button.appendChild(a);}
        //控制透明度
        function alpha(obj,n){if(document.all){obj.style.filter="alpha(opacity="+n+")";}else{obj.style.opacity=(n/100);}}
        //控制焦点按钮
        function sc(n){for(var i=0;i<li.length;i++){button.childNodes[i].className="b1"};button.childNodes[n].className="b2";}
        title.className="num_list";title.appendChild(span);alpha(title,opac1);id.className="d1";div.className="d2";id.appendChild(div);id.appendChild(title);id.appendChild(button);
        //渐显
        var fadeon=function(){opac+=5;div.innerHTML=li[j].innerHTML;span.innerHTML=getTag("img",li[j])[0].alt;alpha(div,opac);if(scton==0){sc(j);num=-2;scrolltxt();scton=1};if(opac<100){timer=setTimeout(fadeon,interv2)}else{timer2=setTimeout(fadeout,interv);};}
        //渐隐
        var fadeout=function(){opac-=5;div.innerHTML=li[j].innerHTML;alpha(div,opac);if(scton==0){num=2;scrolltxt();scton=1};if(opac>0){timer=setTimeout(fadeout,interv2)}else{if(j<li.length-1){j++}else{j=0};fadeon()};}
        //滚动文字
        var scrolltxt=function(){t+=num;span.style.marginTop=t+"px";if(num<0&&t>3){timer3=setTimeout(scrolltxt,interv2)}else if(num>0&&t<62){timer3=setTimeout(scrolltxt,interv2)}else{scton=0}};
        fadeon();
    }
    //初始化
    window.onload=s;
</script>

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