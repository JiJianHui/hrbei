<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-31
  Time: 下午6:43
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link href="/css/search.css" rel="stylesheet" type="text/css" />

<div>
    <div class="companys" style="min-height: 10px">

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

    <div class="products">
        <%--<div class="productCategory">笔记本</div>--%>
        <s:iterator value="products" id="product" status="st">

            <s:if test="#st.index%4 == 0"><div class="productLines"></s:if>
            <div class="productItem">
                <img src="<s:property value="#product.logo"/>"/>
                <div class="productBrand">
                    <s:property value="#product.name"/> | <s:property value="#product.xingHao"/>
                </div>
                <div class="productPrice">约&nbsp;<b>¥</b> <span class="priceNum"><s:property value="#product.vipPrice"/></span>
                    <span class="normalPrice"><s:property value="#product.price"/></span>
                </div>
                <div class="productOwner"><s:property value="#product.address"/></div>
            </div>
            <s:if test="#st.index%4 == 3"></div></s:if>
            <s:else><div class="emptyBar"></div></s:else>
        </s:iterator>

        <%--
        <div class="productLines">

            <div class="productItem">
                <img src="/images/search/sp2_07.jpg"/>
                <div class="productBrand">
                    ThinkPad E431-627714英寸 1T Rambo 1G独显
                </div>
                <div class="productPrice">约&nbsp;<b>¥</b> <span class="priceNum">3300.00</span>
                    <span class="normalPrice">5000.00</span>
                </div>
                <div class="productOwner">Thinkpad 官方旗舰店 浙江杭州</div>
            </div>

            <div class="productItem">
                <img src="/images/search/sp2_08.jpg"/>
                <div class="productBrand">
                    ThinkPad E431-627714英寸 1T Rambo 1G独显
                </div>
                <div class="productPrice">约&nbsp;<b>¥</b> <span class="priceNum">3300.00</span>
                    <span class="normalPrice">5000.00</span>
                </div>
                <div class="productOwner">Thinkpad 官方旗舰店 浙江杭州</div>
            </div>

            <div class="productItem">
                <img src="/images/search/sp2_10.jpg"/>
                <div class="productBrand">
                    ThinkPad E431-627714英寸 1T Rambo 1G独显
                </div>
                <div class="productPrice">约&nbsp;<b>¥</b> <span class="priceNum">3300.00</span>
                    <span class="normalPrice">5000.00</span>
                </div>
                <div class="productOwner">Thinkpad 官方旗舰店 浙江杭州</div>
            </div>

            <div class="productItem" style="margin-right: 0px;">
                <img src="/images/search/sp2_10.jpg"/>
                <div class="productBrand">
                    ThinkPad E431-627714英寸 1T Rambo 1G独显
                </div>
                <div class="productPrice">约&nbsp;<b>¥</b> <span class="priceNum">3300.00</span>
                    <span class="normalPrice">5000.00</span>
                </div>
                <div class="productOwner">Thinkpad 官方旗舰店 浙江杭州</div>
            </div>

        </div>
        --%>

    </div>

    <s:form id="postPageForm" action="searchAll">
        <s:hidden name="searchAllStr"/>
        <tiles:insertTemplate template="/jsp/paginationPost.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>
    </s:form>

</div>