<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-7
  Time: 上午3:19
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link href="/css/search.css" rel="stylesheet" type="text/css" />

<div>
    <!--搜索部分-->
    <div class="query queryCategory" >
        <form id="searchForm" action="searchProduct.html" method="post">
            <s:textfield id="searchStr" name="searchStr" type="text" title="请输入您要查询的公司" />
            <input id="searchSubmit" name="searchSubmit" type="submit" value="查询" title="查询" />
        </form>
    </div>

    <div class="products">
        <%--<div class="productCategory">笔记本</div>--%>
        <s:iterator value="products" id="product" status="st">

            <s:if test="#st.index%4 == 0"><div class="productLines"></s:if>
                <div class="productItem">
                    <a href="productBlog.html?product.id=<s:property value="#product.id"/>">
                    <img src="<s:property value="#product.logo"/>"/></a>
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

    <s:form id="postPageForm" action="searchProduct">
        <s:hidden name="searchStr"/>
        <tiles:insertTemplate template="/jsp/paginationPost.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>
    </s:form>
    <%--<div class="products">
        <div class="productCategory">品牌电脑</div>
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

    </div>--%>

    <%--<div class="products">
        <div class="productCategory">办公设备</div>
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

    </div>
    --%>
</div>

<div style="clear: both;"></div>

<script type="text/javascript">
    document.getElementById("menuProduct").className = 'navSelected';
</script>