<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-13
  Time: 下午10:12
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%--在左侧导航菜单中：分为用户在浏览公司及产品的时候的左侧导航以及用户个人中心的导航，因此我们针对用户有个人独自--%>

<div class="userMenu">

    <div class="linksGroup">
        <div class="portrait">
            <a class="por" href="userBlog.html" title="<s:property value='#session.nickName'/>">
                <img id="usermenu_user_img" src="<s:property value='#session.userLogoUrl'/>" alt="<s:property value="#session.nickName"/>"/>
            </a>
            <a class="nick" href="userBlog.html?user.id=<s:property value='#session.userID'/>">
                <s:property value="#session.nickName"/>
            </a>
        </div>
    </div>

    <div class="linksGroup">
        <h3 class="h3_title">个人</h3>
        <ul>
            <li><a href="userInfo.html" title="个人信息">个人信息</a></li>
            <li><a href="userInfo.html" title="个人收藏">个人收藏</a></li>
        </ul>
    </div>

    <div class="linksGroup">
        <h3 class="h3_title">商店</h3>
        <ul>
            <li><a href="myCompany.html" title="我的公司">我的公司</a></li>
            <li><a href="initCreateCompany.html" title="创建公司">创建公司</a></li>
            <li><a href="myProducts.html" title="我的商品">我的商品</a></li>
        </ul>
    </div>

    <div class="linksGroup">
        <h3 class="h3_title">新闻</h3>
        <ul>
            <li><a href="myNews.html" title="我的新闻">我的新闻</a></li>
            <li><a href="initCreateNews.html" title="发布新闻">发布新闻</a></li>
        </ul>
    </div>

</div>