<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-7
  Time: 上午12:38
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link href="/css/search.css" rel="stylesheet" type="text/css" />

<div>
    <!--搜索部分-->
    <div class="query" >
        <form id="searchForm" action="searchCompany.html" method="post">
            <s:textfield id="searchStr" name="searchStr" type="text" title="请输入您要查询的文字" />
            <input id="searchSubmit" name="searchSubmit" type="submit" value="查询" title="查询" onclick="return checkSearchForm();" />
            <span class="errorinfo" id="searchMsg"></span>
        </form>
        <script type="text/javascript">
            function checkSearchFrom(){
                if( $("#searchStr").val.length == 0 ){
                    $("#searchMsg").innerHTML("请输入查找文字");
                    return false;
                }
                $("#searchMsg").innerHTML("");
                return true;
            }
        </script>
    </div>

    <div class="companys">

        <s:iterator value="companies" id="company">
            <div class="comanyLine">

                <div class="companyLineLeft">
                    <div class="basicLogo"><a href="companyBlog.html?company.id=<s:property value="#company.id"/>">
                        <img src="<s:property value="#company.logo"/>"/>
                    </a></div>
                    <div class="basicInfo">
                        <span class="infoTitle">商家：</span><a href="companyBlog.html?company.id=<s:property value="#company.id"/>"><s:property value="#company.name"/></a><br/>
                        <div class="textLong"><span class="infoTitle">主营：</span><s:property value="#company.productDescription"/></div>
                        <div class="textLong"><span class="infoTitle">地址：</span><s:property value="#company.address"/></div>
                        <span class="infoTitle">电话：</span><s:property value="#company.phone"/><br/>
                    </div>
                </div>

                <div class="companyLineRight">

                    <s:iterator value="#company.products" status="st" id="product">
                        <s:if test="#st.index<3">
                            <div class="hotProduct">
                                <a href="productBlog.html?product.id=<s:property value="#product.id"/>">
                                <img src="<s:property value="#product.logo"/>"/>
                                <div class="hotProductInfo"><s:property value="#product.name"/></div>
                                </a>
                                <div class="hotProductPrice">约&nbsp;<b>¥</b> <span class="priceNum"><s:property value="#product.price"/></span></div>
                            </div>
                        </s:if>
                    </s:iterator>

                </div>

            </div>
        </s:iterator>

    </div>

    <s:form id="postPageForm" action="searchCompany">
        <s:hidden name="searchStr"/>
        <tiles:insertTemplate template="/jsp/paginationPost.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>
    </s:form>

</div>

<script type="text/javascript">
    document.getElementById("menuCompany").className = 'navSelected';
</script>