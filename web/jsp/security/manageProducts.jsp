<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-24
  Time: 下午2:26
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" type="text/css" href="/css/user/myCompany.css">

<div class="stepBar">
    <a href="userCenter.html"> 个人中心</a>
    <span class="sepeator">></span>
    <a href="manageProduct.html"> 产品管理</a>
    <span class="sepeator">></span>
    产品列表
</div>


<div class="myCompanys">
    <s:iterator value="products">
        <div class="companyItem">

            <p class="companyLogo">
                <a href="productBlog.html?product.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <img src="<s:property value="logo"/>"/>
                </a>
            </p>

            <div class="infoWrap">
                <h4><a href="productBlog.html?product.id=<s:property value="id"/>"title="<s:property value="name"/>">
                    <s:property value="name"/></a><span class="date">2014-07-18</span>
                </h4>

                <p class="maintenance">
                    <span><strong>•</strong><span class="bar">销量:&nbsp;&nbsp;</span>156</span>
                    <span><strong>•</strong><span class="bar">评论:&nbsp;&nbsp;</span>200条</span>
                    <span><strong>•</strong><span class="bar">状态:&nbsp;&nbsp;</span>热销中</span>
                </p>

                <div class="details cf">
                    <s:property value="getPureText(description)"/>
                </div>

                <p class="time">
                    <a class="manage_links" href="initUpdateProduct.html?product.id=<s:property value="id"/>">
                        更改信息</a>

                    <a class="manage_links" href="#" onclick="confirmDeleteProduct('<s:property value="id"/>', '<s:property value="name"/>')">
                        删除商品</a>
                </p>
            </div>

        </div>
    </s:iterator>

</div>

<tiles:insertTemplate template="/jsp/pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>

<s:form id="deleteCompanyForm" action="ajaxDeleteProduct" method="post">
    <s:hidden name="product.id" id="deleteCompanyId" />
</s:form>

<script type="text/javascript">

    function confirmDeleteProduct (id,statusName) {
        if(confirm("确定删除该商品: " + statusName))
        {
            document.getElementById("deleteCompanyId").value = id;

            var url="ajaxDeleteProduct.html";
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
