<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-4-18
  Time: 下午3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><tiles:insertAttribute name="title" ignore="true"/></title>
    <meta name="Keywords" content="哈尔滨电子企业报价网" />
    <meta name="description" content="哈尔滨电子企业报价网 " />
    <meta name="robots" content="index,follow" />
    <link rel="shortcut icon" type="image/x-icon" href="/images/fav.ico"/>
    <!--[if IE 6]->
        <style>
        #root{height:100%;} /* IE在高度不够时会自动撑开层*/
        </style>
    <![endif]-->
    <%@ include file="includeForLayout.jsp" %>
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
</head>

<link href="/css/index.css" rel="stylesheet" type="text/css" />

<body>

<div id="main" style="margin-top: 0px;" id="mainBoady">

    <%--网页顶部，包括了登陆menubar和top展示--%>
    <div class="header"><tiles:insertAttribute name="header"/></div>

    <%--网页中部，用于展示信息--%>
    <div id="container">

        <%--网页中部展示信息主面板--%>
        <div id="container1">
            <div id="left"><tiles:insertAttribute name="leftMenu"/></div>
            <div id="right">
                <div id="navigator"><tiles:insertAttribute name="navigator"/></div>
                <div id="content"><tiles:insertAttribute name="content"/></div>
            </div>
        </div>

        <%--网页中部的底部用于展示广告灯--%>
        <div id="container2"><tiles:insertAttribute name="scrollADs"/></div>
        <div style="clear: both;"></div>
    </div>

    <div id="footerDiv">
        <div class="commonLinks">
        <a href="#">中关村在线</a>
        <a href="#">百度</a>
        <a href="#">58同城</a>
        <a href="#">网易163</a>
        <a href="#">搜狐网</a>
        <a href="#">新浪微博</a>
        <a href="#">驱动之家</a>
    </div>
    <%--网页底部用于展示版权信息等--%>
        <div id="footer"><tiles:insertAttribute name="footer"/></div>
    </div>
</div>
<div id="fade" class="black_overlay"></div>
</body>

</html>