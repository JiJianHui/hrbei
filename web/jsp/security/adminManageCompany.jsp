<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-25
  Time: 下午6:03
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link href="/css/security/manageCompany.css" type="text/css" rel="stylesheet" />

<div class="adminDiv">
    <table>
    <s:iterator value="companys">
        <tr>
            <td><s:property value="logo"/> </td>
            <td><s:property value="name"/></td>
            <td><s:property value="address"/></td>
            <td><s:property value="contactName"/></td>
            <td><s:property value="description"/></td>
            <td><s:property value="isDeleted"/></td>
            <td><s:property value="status"/></td>
        </tr>
    </s:iterator>
    </table>
</div>