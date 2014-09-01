<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-7-21
  Time: 下午4:00
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<div class="left_content" style="border-right:dotted 0px blue;border-left: dotted 0px blue; min-height: 400px;">

    <%--<div class="item"><a href="jobContent.html" title="">平板 | 平板测首款64位安卓平板 科技巨头总部比拼</a></div>--%>
    <div style="min-height: 500px;">
    <s:iterator value="newses">
        <div class="item">
            <a href="newsBlog.html?news.id=<s:property value="id"/>" title="">
                <s:property value="pubOrg"/>&nbsp;|&nbsp;<s:property value="title"/>&nbsp;<s:date name="pubTime" format="yyyy-MM-dd"/>
            </a>
        </div>
    </s:iterator>
    </div>

    <tiles:insertTemplate template="/jsp/pagination.jsp">
        <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>
</div>

<!--右侧正文内容-->
<div class="right_content">

    <!--滚动的图片广告-->
    <div id="scrollAd">
        <div id="fade_focus">
            <div class="loading">Loading...</div>
            <ul>
                <li><a href="<s:property value="websiteLinks1"/>"><img src="<s:property value="websiteImages1"/>" width="300" height="185" /></a></li>
                <li><a href="<s:property value="websiteLinks2"/>"><img src="<s:property value="websiteImages2"/>" width="300" height="185" /></a></li>
                <li><a href="<s:property value="websiteLinks3"/>"><img src="<s:property value="websiteImages3"/>" width="300" height="185" /></a></li>
                <li><a href="<s:property value="websiteLinks4"/>"><img src="<s:property value="websiteImages4"/>" width="300" height="185" /></a></li>
                <li><a href="<s:property value="websiteLinks5"/>"><img src="<s:property value="websiteImages5"/>" width="300" height="185" /></a></li>
            </ul>
        </div>
    </div>

    <!--登录/注册-->
    <div id="login">
        <img src="images/login.jpg"  usemap="#Map"/>
        <map name="Map" class="Map">
            <area shape="rect" coords="96,27,175,47" href="login.html" title="登录" />
            <area shape="rect" coords="198,27,276,47" href="register.html" title="注册" />
            <area shape="rect" coords="215,50,282,68" href="forgestPassword.html" title="忘记密码？" />
        </map>
    </div>


    <div class="bianMin">
        <div class="title">便民服务</div>
        <div class="icons">
             <div class="iconLine">
                 <div style="background:url('/images/index/huafei.jpg') no-repeat;" class="iconText">
                     <a href="http://www.tmall.com/" target="_blank">话费</a>
                 </div>
                 <div style="background:url('/images/index/game.jpg') no-repeat;" class="iconText">
                     <a href="http://game.qq.com" target="_blank">游戏</a>
                 </div>
                 <div style="background:url('/images/index/travel.jpg') no-repeat;" class="iconText">
                     <a href="http://www.ctrip.com/" target="_blank">旅行</a></div>
                 <div style="background:url('/images/index/baoxian.jpg') no-repeat;" class="iconText">
                     <a href="http://baoxian.taobao.com" target="_blank">保险</a></div>
             </div>
            <div class="iconLine">
                <div style="background:url('/images/index/calendar.jpg') no-repeat;" class="iconText">
                    <a href="http://game.qq.com/index.shtml/" target="_blank">日历</a></div>
                <div style="background:url('/images/index/movie.jpg') no-repeat;" class="iconText">
                    <a href="http://dianying.taobao.com/" target="_blank"> 电影</a></div>
                <div style="background:url('/images/index/food.jpg') no-repeat;" class="iconText">
                    <a href="http://hrb.meituan.com/" target="_blank">餐饮</a></div>
                <div style="background:url('/images/index/bank.jpg') no-repeat;" class="iconText">
                    <a href="https://financeprod.alipay.com/fund/index.htm" target="_blank">银行</a></div>
            </div>
            <div class="iconLine">
                <div style="background:url('/images/index/ebook.jpg') no-repeat;" class="iconText">
                    <a href="http://www.qidian.com" target="_blank">电子书</a></div>
                <div style="background:url('/images/index/music.jpg') no-repeat;" class="iconText">
                    <a href="http://www.xiami.com/" target="_blank">音乐</a></div>
                <div style="background:url('/images/index/water.jpg') no-repeat;" class="iconText">
                    <a href="http://life.taobao.com/market/sdmjf2011.php" target="_blank">水电</a></div>
                <div style="background:url('/images/index/waiting.jpg') no-repeat;" class="iconText">
                    <a href="#" target="_blank">请期待</a></div>
            </div>
        </div>
    </div>
</div>

<style>

    .bianMin{
        float: left;
        width: 300px;
        margin-top: 20px;
        background-color: #f8f8ff;
    }

    .bianMin .title{
        font-weight: bold;
        font-size: 15px;
        letter-spacing: 2px;
        color: #808080;
        margin-left: 10px;
        margin-bottom: 10px;
        font-family: Tahoma, Geneva,"\5FAE\8F6F\96C5\9ED1","\5b8b\4f53",sans-serif;
    }

    .iconLine{
        margin-bottom: 10px;
    }
    .iconText{
        width: 60px;
        height: 60px;
        border: 1px solid #dcdcdc;
        font-size: 13px;
        padding-top: 35px;
        text-align: center;
        float: left;
        margin-left: 10px;
        margin-bottom: 10px;
        color: graytext;
        cursor: hand;
        /*line-height: 60px;*/
    }

    .iconText a{
        color: graytext;
        text-decoration: none;
    }
</style>