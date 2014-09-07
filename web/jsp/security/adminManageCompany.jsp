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

<link rel="stylesheet" type="text/css" href="/css/user/myCompany.css">

<div class="stepBar">
    <a href="initAdminManageCompany.html"> 公司审核管理</a>
    <span class="sepeator">></span>公司列表
</div>

<div class="myCompanys">
    <s:iterator value="companies">
        <div class="companyItem">

            <p class="companyLogo">
                <a href="companyBlog.html?company.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <img src="<s:property value="logo"/>"/>
                </a>
            </p>

            <div class="infoWrap">
                <h4><a href="companyBlog.html?course.id=<s:property value="id"/>"title="<s:property value="name"/>">
                    <s:property value="name"/></a><span class="date">2014-07-18</span>
                </h4>

                <p class="maintenance">
                    <span><strong>•</strong><span class="bar">产品:&nbsp;&nbsp;</span>200种</span>
                    <span><strong>•</strong><span class="bar">销量:&nbsp;&nbsp;</span>156</span>
                    <span><strong>•</strong><span class="bar">评论:&nbsp;&nbsp;</span>200条</span>
                    <span><strong>•</strong><span class="bar">状态:&nbsp;&nbsp;</span>审核中</span>
                </p>

                <div class="details">
                    <s:property value="getPureText(description)"/>
                </div>

                <p class="time">

                    <s:if test="status==0">
                        <a class="manage_links" href="#" onclick="confirmChangeCompany('<s:property value="id"/>','1','通过审核')">
                            通过审核</a>
                    </s:if>
                    <s:else><a href="#" class="manage_links">已审核</a> </s:else>

                    <a class="manage_links" href="#" onclick="confirmDeleteComany('<s:property value="id"/>', '<s:property value="name"/>')">
                        删除商店</a>
                </p>
            </div>

        </div>
    </s:iterator>
    <s:if test="companies.size() == 0">
        <div style="margin-top: 20px;margin-left: 10px;color: #dc143c;">
            <h4>暂时没有需要审核的商店！</h4>
        </div>

    </s:if>
</div>

<tiles:insertTemplate template="/jsp/pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>

<s:form id="changeCompanyForm" action="ajaxChangeCompanyStatus" method="post">
    <s:hidden name="company.id" id="companyId" />
    <s:hidden name="company.status" id="status"/>
</s:form>

<s:form id="deleteCompanyForm" action="ajaxChangeCompanyStatus" method="post">
    <s:hidden name="company.id" id="deleteCompanyId" />
</s:form>

<script type="text/javascript">
    function confirmChangeCompany (id,status, statusName) {
        if(confirm("确定更改该公司状态为: " + statusName))
        {
            document.getElementById("companyId").value = id;
            document.getElementById("status").value = status;

            var url="ajaxChangeCompanyStatus.html";
            var userData = $("#changeCompanyForm").serialize();

            $.post(url,userData,function(data)
            {
                if(data=="success"){
                    alert("状态更改成功");
                    window.location.reload();
                }else{
                    alert("状态更改失败！");
                }
            },"text");
        }
    }

    function confirmDeleteComany (id,statusName) {
        if(confirm("确定删除该公司: " + statusName))
        {
            document.getElementById("deleteCompanyId").value = id;

            var url="ajaxDeleteCompany.html";
            var userData = $("#deleteCompanyForm").serialize();

            $.post(url,userData,function(data)
            {
                if(data=="success"){
                    alert("删除成功");
                    window.location.reload();
                }else{
                    alert("删除失败！");
                }
            },"text");
        }
    }

</script>