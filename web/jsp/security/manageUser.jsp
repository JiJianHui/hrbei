<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-27
  Time: 下午3:58
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link rel="stylesheet" type="text/css" href="/css/security/manageUser.css">

<div class="manageUserDiv">

    <div class="administorList">
        <label class="title">已有的管理人员</label>
        <table>
            <tr>
                <th>ID</th>
                <th>昵称</th>
                <th>邮箱</th>
            </tr>

            <s:iterator value="administors">
            <tr>
                <td><s:property value="id"/></td>
                <td><s:property value="nickName"/></td>
                <td><s:property value="email"/></td>
            </tr>
        </s:iterator>

        </table>
    </div>
    <div class="addNewAdmin">
        <s:form id="addManageUserForm" method="post" cssClass="form-horizontal" action="ajaxAddManageUser">
            <label class="title">添加新管理人员</label>
            <br/>
            <label>邮箱:</label>
            <input type="email" class="input" name="newAdminEmail" id="addEmail"/>
            <button type="button" id="addManageUserBtn" class="btn btn-primary btn-success">&nbsp;&nbsp;添加&nbsp;&nbsp;</button>
            <span id="submit_msg" style="color:red; font-weight: bold;font-size: 13px"></span>
        </s:form>

    </div>

    <div class="addNewAdmin">
        <s:form id="deleteAdminUser" method="post" cssClass="form-horizontal" action="ajaxDeleteAdminUser">
            <label class="title">删除管理人员</label>
            <br/>
            <label>邮箱:</label>
            <input type="email" class="input" name="newAdminEmail" id="deleteEmail"/>
            <button type="button" id="deleteAdminUserBtn" class="btn btn-primary btn-success">&nbsp;&nbsp;删除&nbsp;&nbsp;</button>
            <span id="submit_msg_delete" style="color:red; font-weight: bold;font-size: 13px"></span>
        </s:form>

    </div>

</div>

<script type="text/javascript">


    $("#addManageUserBtn").click(function(){

        if( document.getElementById("addEmail").value.length == 0 ){
            $("#submit_msg").html("请输入正确的邮箱");
            return;
        }

        var url="ajaxAddManageUser.html";
        var userData = $("#addManageUserForm").serialize();
        $.post(url,userData,function(data)
        {

            if(data =="success"){
                $("#submit_msg").html("添加新的管理员成功");
                window.location.reload();
            }
            else{
                $("#submit_msg").html(data);
            }
        },"text");

    });

    $("#deleteAdminUserBtn").click(function(){

        if(document.getElementById("deleteEmail").value.length == 0 ){
            $("#submit_msg_delete").html("请输入正确的邮箱");
            return;
        }

        var url="ajaxDeleteAdminUser.html";
        var userData = $("#deleteAdminUser").serialize();
        $.post(url,userData,function(data)
        {

            if(data =="success"){
                $("#submit_msg").html("删除管理员成功");
                window.location.reload();
            }
            else{
                $("#submit_msg").html(data);
            }
        },"text");

    });

</script>