<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-14
  Time: 下午2:55
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link rel="stylesheet" type="text/css" href="/css/user/myCompany.css">

<div class="stepBar">
    <a href="myCompany.html"> 我的公司</a>
    <span class="sepeator">></span>公司列表
</div>

<div class="myCompanys">
    <s:iterator value="companys">
    <div class="companyItem">

        <p class="companyLogo">
            <a href="companyBlog.html?company.id=<s:property value="id"/>" title="<s:property value="name"/>">
                <img src="<s:property value="logo"/>"/>
            </a>
        </p>

        <div class="infoWrap">
            <h4><a href="companyBlog.html?company.id=<s:property value="id"/>"title="<s:property value="name"/>">
                <s:property value="name"/></a><span class="date">2014-07-18</span>
            </h4>

            <p class="maintenance">
                <span><strong>•</strong><span class="bar">产品:&nbsp;&nbsp;</span>200种</span>
                <span><strong>•</strong><span class="bar">销量:&nbsp;&nbsp;</span>156</span>
                <span><strong>•</strong><span class="bar">评论:&nbsp;&nbsp;</span>200条</span>
                <span><strong>•</strong><span class="bar">状态:&nbsp;&nbsp;</span>审核中</span>
            </p>

            <p class="details cf">
                <span class="fl"><s:property value="description"/></span>
            </p>

            <p class="time">
                <a class="manage_links" href="initUpdateCompany.html?company.id=<s:property value="id"/>">
                    基本信息</a>
                <a class="manage_links" href="/companyProducts.html?company.id=<s:property value="id"/>">
                    公司商品</a>

                <a class="manage_links" href="/initAddProduct.html?company.id=<s:property value="id"/>">
                    增加商品</a>


                <a class="manage_links" href="/companyNews.html?company.id=<s:property value="id"/>">
                    新闻列表</a>

                <a class="manage_links" href="/initCreateCompanyNews.html?company.id=<s:property value="id"/>">
                    发布新闻</a>

                <%--<a class="manage_links" href="/deleteCompany.html?company.id=<s:property value="id"/>">--%>
                <a class="manage_links" href="#" onclick="confirmDeleteComany('<s:property value="id"/>', '<s:property value="name"/>')">
                    删除商店</a>
            </p>
        </div>

    </div>
    </s:iterator>
</div>

<s:form id="deleteCompanyForm" action="ajaxDeleteCompany" method="post">
    <s:hidden name="company.id" id="deleteCompanyId" />
</s:form>

<script type="text/javascript">

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