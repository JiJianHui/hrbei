<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-7-21
  Time: 下午3:10
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div id="enterprise">
</div>


<s:iterator value="categories">
    <div class="enterprise_col" id="indexMenu<s:property value="id"/>">
        <a href="indexProuctList.html?typeId=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>
    </div>
</s:iterator>