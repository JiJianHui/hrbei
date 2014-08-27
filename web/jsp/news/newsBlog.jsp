<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-27
  Time: 上午10:07
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link href="/css/entertainment.css" rel="stylesheet" type="text/css" />

<div>
    <div class="contentTitle"><s:property value="title"/></div>
    <div class="contentInfo">
        作者：<s:property value="author"/>&nbsp;&nbsp;&nbsp;&nbsp;
        来源：<s:property value="pubOrg"/>&nbsp;&nbsp;&nbsp;&nbsp;
        时间：<s:date name="pubTime" format="MM/dd/yyyy"/></div>
    <div class="contentPage">
       <s:property value="content"/>
    </div>
</div>

<script type="text/javascript">
    document.getElementById("menuJob").className = 'navSelected';
</script>