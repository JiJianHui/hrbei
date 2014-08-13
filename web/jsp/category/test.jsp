
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>笔记本</title>
    <meta name="Keywords" content="哈尔滨电子企业报价网" />
    <meta name="description" content="哈尔滨电子企业报价网 " />
    <meta name="robots" content="index,follow" />
    <!--[if IE 6]->
        <style>
        #root{height:100%;} /* IE在高度不够时会自动撑开层*/
        </style>
    <![endif]-->
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

<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.SuperSlide.2.1.js"></script>

<body>

<div id="main">

    <div class="header">

        <!--网页顶部1：登录/注册/加入收藏/联系我们/客服/站点导航-->
        <div class="headerMenu">

            <dl class="loginRegister">
                <dd>&nbsp;</dd>
                <dd><a href="#">登录</a></dd>
                <dd><a href="#">注册</a></dd>
            </dl>

            <dl class="headerEmpty"></dl>

            <dl class="links">

                <dd><a href="#"><img src="images/collection.jpg"/>加入收藏</a> </dd>
                <dd><a href="#"><img src="images/contact.jpg" />联系我们</a></dd>
                <dd>
                    <a href="#"><img src="images/customerService.jpg"/>客服</a>
                    <ul>
                        <li><a href="#">在线客服</a></li>
                        <li><a href="#">QQ留言</a></li>
                        <li><a href="#">投诉/建议</a></li>
                    </ul>
                </dd>

                <dd><a href="#"><img src="images/websiteNavigator.jpg" />站点导航</a></dd>
            </dl>

        </div>

        <!--网页顶部2：logo/搜索/天气-->
        <div id="headerTop">

            <div class="logo">
                <a href="index.html" title="哈尔滨电子企业报价网"><img src="/images/logo.jpg" class="logoImage" /></a>
            </div>

            <!--搜索部分-->
            <div class="search" align="center">
                <form id="searchForm" action="#" method="post">
                    <input id="searchField" name="searchField" type="text" title="请输入您要查找的关键字" /><input id="searchSubmit" name="searchSubmit" type="button" value="搜索" title="搜索" />
                </form>
            </div>

            <!--天气部分-->
            <div id="weather">

                <iframe width="250" scrolling="no" height="90" frameborder="0" allowtransparency="true"
                        src="http://i.tianqi.com/index.php?c=code&id=2&color=%23C6C6C6&icon=1&num=1"></iframe>
            </div>

        </div>

        <script type="text/javascript">
            jQuery(".headerMenu").slide({ type:"menu",  titCell:"dd", targetCell:"ul", delayTime:0,defaultPlay:false,returnDefault:true  });
        </script>

    </div>

    <div id="container" style="border-bottom: 2px solid #6895c9; clear:both;">


        <div id="container1">
            <div id="left">


                <div id="enterprise">
                </div>

                <div class="enterprise_col"><a href="indexBiJiBen.html">笔 记 本</a><a href="indexBiJiBen.htm1" title="笔记本专区"></a></div>

                <div class="enterprise_col"><a href="indexDianNao.html" title="品牌电脑专区">品牌电脑</a></div>

                <div class="enterprise_col"><a href="indexBanGong.html" title="办公设备专区">办公设备</a></div>

                <div class="enterprise_col"><a href="indexZuZhuangJi.html" title="组装机专区">组&nbsp;装&nbsp;机</a></div>

                <div class="enterprise_col"><a href="indexWangLuo.html" title="网络设备专区">网络设备</a></div>

                <div class="enterprise_col"><a href="indexHaoCai.html" title="办公耗材专区">办公耗材</a></div>

                <div class="enterprise_col"><a href="indexShuMa.html" title="数码产品专区">数码产品</a></div>

                <div class="enterprise_col"><a href="indexDianZiJianKong.html" title="电子监控专区">电子监控</a></div>

                <div class="enterprise_col"><a href="indexSoftware.html" title="软件产品专区">软件产品</a></div>

                <div class="enterprise_col"><a href="indexJiShuFuWu.html" title="技术服务专区">技术服务</a></div>

                <div class="enterprise_col"><a href="indexMobile.html" title="手机产品专区">手机产品</a></div>

                <div class="enterprise_col"><a href="indexWaiShe.html" title="电脑外设专区">电脑外设</a></div>
            </div>
            <div id="right">
                <div id="navigator">

                    <div class="nav" style="width:58px; font-size:20px; font-weight:bold; color:#6895c9; line-height:35px; float:left;">
                        <a href="index.html" title="网站首页">首页</a>
                    </div>

                    <div class="nav"><a href="sc1.html" title="企业查询">企业查询</a></div>
                    <div class="nav"><a href="sp1.html" title="产品查询">产品查询</a></div>
                    <div class="nav"><a href="list.html" title="招聘求职">招聘求职</a></div>
                    <div class="nav"><a href="list.html" title="出租出兑">出租出兑</a></div>
                    <div class="nav"><a href="list.html" title="技术交流">技术交流</a></div>
                    <div class="nav"><a href="list.html" title="美文美景">美文美景</a></div>
                    <div class="nav"><a href="list.html" title="开心一刻">开心一刻</a></div>
                </div>
                <div id="content">

                    <div id="list">
                        <div class="lines">
                            <div class="item">
                                <img src="/images/sp2_08.jpg" alt="title">
                                <br/><span>联想ThinkPad E341 62799-C9C 500G2G独显笔记本电脑</span>
                            </div>

                            <div class="item">
                                <img src="/images/sp2_10.jpg" alt="">
                                <br/><span>Introduction to Public Speaking</span>
                            </div>

                            <div class="item">
                                <img src="/images/sp2_08.jpg" alt="title">
                                <br/><span>联想ThinkPad E341 62799-C9C 500G2G独显笔记本电脑</span>
                            </div>

                            <div class="item">
                                <img src="/images/sp2_10.jpg" alt="">
                                <br/><span>Introduction to Public Speaking</span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="commonLinks">
        <a href="#">中关村在线</a>
        <a href="#">百度</a>
        <a href="#">58同城</a>
        <a href="#">网易163</a>
        <a href="#">搜狐网</a>
        <a href="#">新浪微博</a>
        <a href="#">驱动之家</a>
    </div>


    <div id="footer">


        <div class="copyright">
            技术支持：哈尔滨电子企业报价网信息中心&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客服邮箱
            <a href="mailto:support@gogowise.com" style="text-decoration: none"><span style="color: #6ab600;">support@hrbei.com</span></a>
            <br/>
            网站版权：哈尔滨XXX有限责任公司&nbsp;&nbsp;&nbsp;&nbsp;@CopyRight2014-2016 All Rights Reserved &nbsp;&nbsp;&nbsp;备案号：ICP2134567890
        </div>
    </div>

</div>

</body>

</html>