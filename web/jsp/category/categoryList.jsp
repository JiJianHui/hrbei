<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-7-23
  Time: 上午11:16
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link href="/css/category.css" rel="stylesheet" type="text/css" />

<div id="list">

    <s:iterator value="products" status="st">

        <s:if test="#st.index%5 == 0">
            <div class="lines">
        </s:if>

        <div class="item">
            <img class="itemImg" src="<s:property value="logo"/>" alt="title" id="<s:property value="id"/>">
            <br/><span><s:property value="name"/> </span>
        </div>

        <s:if test="#st.index%5==4 || #st.last">
            </div>
        </s:if>

    </s:iterator>

    <s:if test="products.size()==0">
        <div style="font-size: 15px;">
            对不起，暂时没有对应的产品。
        </div>

    </s:if>

    <!--
    <div class="lines">
        <div class="item" id="item1">
            <img class="itemImg" src="/images/item.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/01.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/item.jpg" alt="title">
            <br/><span>联想 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/02.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/item.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>
    </div>
    -->

</div>

<script type="text/javascript">
    document.getElementById("indexMenu<s:property value="typeId"/>").className = 'enterprise_col_selected';

    $(document).ready(function () {

        $(".itemImg").click(function (event) {
            var productId = window.event.srcElement.id;
            document.getElementById("light"+productId).style.display='block';
            document.getElementById('fade').style.display='block';
        });

    })

</script>


<s:iterator value="products" id="product">
    <div id="light<s:property value="#product.id"/>" class="white_content">

        <div class="briefInfo">
            <div class="briefHead">
                <div class="briefHeadLeft">认证商家资料---<s:property value="#product.company.name"/></div>
                <div class="briefHeadRight">
                    <a href="javascript:void(0)" onclick="document.getElementById('light<s:property value="#product.id"/>').style.display='none';
                            document.getElementById('fade').style.display='none'">
                            [&nbsp;关&nbsp;闭&nbsp;]
                    </a>
                </div>
            </div>
            <div class="briefIntro">
                <div class="beiefIntroItem"><span>企业名称：</span><a href="companyBlog.html" class="companyName"><s:property value="#product.company.name"/></a></div>
                <div class="beiefIntroItem"><span>企业简介：</span><s:property value="#product.company.description"/> </div>
                <div class="beiefIntroItem"><span>商家特色：</span>联想从事开发、制造并销售可靠的、安全易用的技术产品及优质专业的服务，帮助全球客户和合作伙伴取得成功。</div>
            </div>

            <div class="briefPrice">
                <div class="briefPriceLeft">部分产品报价：</div>
                <div class="briefPriceRight">在线咨询<img src="/images/tixing.jpg"/>QQ留言<img src="/images/qq.gif"></div>
            </div>

            <div class="briefPriceTable">
                <table class="priceTable">
                    <tr class="head">
                        <th class="tdNormal">产品</th><th class="tdNormal tdCenter">品牌</th>
                        <th class="tdNormal">型号</th><th class="tdLong">指标</th>
                        <th class="tdShort">会员价</th><th class="tdShort">市场价</th>
                    </tr>

                    <s:iterator value="#product.company.products" id="companyProducts" status="st">
                        <s:if test="#st.index<10" >
                            <tr>
                                <td class="tdNormal">
                                    <a href="productBlog.html?product.id=<s:property value="#product.id"/>">
                                    <s:property value="#companyProducts.name"/>
                                    </a>
                                </td>
                                <td class="tdNormal tdCenter"><s:property value="#companyProducts.brand"/> </td>
                                <td class="tdNormal"><s:property value="#companyProducts.xingHao"/> </td>
                                <td class="tdLong"><s:property value="#companyProducts.zhiBiao"/> </td>
                                <td class="tdShort"><s:property value="#companyProducts.vipPrice"/> </td>
                                <td class="tdShort"><s:property value="#companyProducts.price"/> </td>
                            </tr>
                        </s:if>
                    </s:iterator>

                    <tr>
                        <td>thinkpad u330p</td><td>联想电脑</td>
                        <td>u330p-2312</td><td>酷睿i5二代</td>
                        <td>3650</td><td>3850</td>
                    </tr>



                </table>
                <div style="text-align: right;width: 100%;">
                    <a href="companyBlog.html?company.id=<s:property value="#product.company.id"/>" >
                    更多产品信息请进入企业店铺>>
                    </a>
                </div>
            </div>

            <div class="briefFooter">
                <div class="footerItem"><span>地&nbsp;&nbsp;&nbsp;址:</span><s:property value="#product.company.address"/></div>
                <div class="footerItem"><span>联系人:</span><s:property value="#product.company.contactName"/></div>
                <div class="footerItem"><span>固&nbsp;&nbsp;&nbsp;话:</span><s:property value="#product.company.phone"/></div>
                <div class="footerItem"><span>手&nbsp;&nbsp;&nbsp;机:</span><s:property value="#product.company.mobilePhone"/></div>
                <div class="footerItem"><span>邮&nbsp;&nbsp;&nbsp;箱:</span><s:property value="#product.company.email"/></div>
            </div>
            <div class="emptyFooter"></div>
        </div>

    </div>

</s:iterator>
