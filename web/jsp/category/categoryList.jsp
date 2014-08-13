<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-7-23
  Time: 上午11:16
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link href="/css/category.css" rel="stylesheet" type="text/css" />

<div id="list">
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

    <div class="lines">
        <div class="item">
            <img class="itemImg" src="/images/item.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/06.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/08.jpg" alt="title">
            <br/><span>联想 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/04.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/07.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>
    </div>

    <div class="lines">
        <div class="item">
            <img class="itemImg" src="/images/item.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/06.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/08.jpg" alt="title">
            <br/><span>联想 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/04.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/07.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>
    </div>

    <div class="lines">
        <div class="item">
            <img class="itemImg" src="/images/item.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/06.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/08.jpg" alt="title">
            <br/><span>联想 </span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/04.jpg" alt="">
            <br/><span>Introduction to Public Speaking</span>
        </div>

        <div class="item">
            <img class="itemImg" src="/images/brand/07.jpg" alt="title">
            <br/><span>联想ThinkPad E341 </span>
        </div>
    </div>
    <%--<div class="rowLines">--%>
        <%--<div class="colItem">--%>
            <%--<img class="itemImg" src="/images/sp2_08.jpg" alt="title">--%>
            <%--<br/><span>联想ThinkPad E341 62799-C9C 500G2G独显笔记本电脑</span>--%>
        <%--</div>--%>

        <%--<div class="colItem">--%>
            <%--<img class="itemImg" src="/images/sp2_10.jpg" alt="">--%>
            <%--<br/><span>Introduction to Public Speaking</span>--%>
        <%--</div>--%>
    <%--</div>--%>

</div>

<script type="text/javascript">
    document.getElementById("biJiBen").className = 'enterprise_col_selected';

    $(document).ready(function () {

        $(".itemImg").click(function (event) {
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block';
        });

    })
    <%--
    window.onload = function() {
        document.onclick = function(e) {
            var ele = e ? e.target : window.event.srcElement;
            if(ele.id !== 'light'  && document.getElementById('light').style.display=='block' )
            {
                document.getElementById('light').style.display = 'none';
            }
        };
    };
    ---%>

</script>

<div id="light" class="white_content">

    <div class="briefInfo">
        <div class="briefHead">
            <div class="briefHeadLeft">认证商家资料</div>
            <div class="briefHeadRight">
                <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                    <%--<img src="/images/close.png"/>--%>[Close]
                </a>
            </div>
        </div>
        <div class="briefIntro">
            <div class="beiefIntroItem"><span>企业名称：</span><a href="companyBlog.html" class="companyName">北京中关村联想中国电脑有限公司</a></div>
            <div class="beiefIntroItem"><span>企业简介：</span>联想公司主要生产台式电脑、服务器、笔记本电脑、打印机、掌上电脑、主板、手机 、一体机电脑等商品。 </div>
            <div class="beiefIntroItem"><span>商家特色：</span>联想从事开发、制造并销售可靠的、安全易用的技术产品及优质专业的服务，帮助全球客户和合作伙伴取得成功。</div>
        </div>

        <div class="briefPrice">
            <div class="briefPriceLeft">部分产品报价：</div>
            <div class="briefPriceRight">在线咨询<img src="/images/tixing.jpg"/>QQ留言<img src="/images/qq.gif"></div>
        </div>

        <div class="briefPriceTable">
            <table class="priceTable">
                <tr class="head">
                    <th>产品</th><th>品牌</th>
                    <th>型号</th><th>指标</th>
                    <th>会员价</th><th>市场价</th>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

                <tr>
                    <td>thinkpad u330p</td><td>联想电脑</td>
                    <td>u330p-2312</td><td>酷睿i5二代</td>
                    <td>3650</td><td>3850</td>
                </tr>

            </table>
            <div style="text-align: right;width: 100%;"><a href="companyBlog.html" > 更多产品信息请进入企业店铺>></a></div>
        </div>

        <div class="briefFooter">
            <div class="footerItem"><span>地&nbsp;&nbsp;&nbsp;址:</span>哈尔滨市教化电子大世界A栋501室</div>
            <div class="footerItem"><span>联系人:</span>张明月</div>
            <div class="footerItem"><span>固&nbsp;&nbsp;&nbsp;话:</span>86403125</div>
            <div class="footerItem"><span>手&nbsp;&nbsp;&nbsp;机:</span>18745142510</div>
            <div class="footerItem"><span>邮&nbsp;&nbsp;&nbsp;箱:</span>lianxian@163.com</div>
        </div>
        <div class="emptyFooter"></div>
    </div>

</div>
