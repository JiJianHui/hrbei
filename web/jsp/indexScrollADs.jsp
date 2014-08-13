<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-7-21
  Time: 下午3:26
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="colee_left" style="margin-left:5px;overflow:hidden;width:1014px;height:145px;" align="center">

    <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" id="colee_left1">
                <table border="0" cellpadding="2" cellspacing="2">
                    <tr>
                        <td>
                            <a href='http://www.sougou.com' title='搜狗网址导航' target='_blank'>
                                <img src='images/ScrollAdPic/1.jpg' class="scrollImg" /></a>
                        </td>

                        <td>
                            <a href='http://www.sina.com.cn' title='新浪' target='_blank'>
                                <img src='images/ScrollAdPic/2.jpg' class="scrollImg" /></a>
                        </td>

                        <td>
                            <a href='http://weibo.com' title='新浪微博' target='_blank'>
                                <img src='images/ScrollAdPic/3.jpg' class="scrollImg" /></a>
                        </td>

                        <td>
                            <a href='http://www.taobao.com' title='天猫淘宝' target='_blank'>
                                <img src='images/ScrollAdPic/4.jpg' class="scrollImg" /></a>
                        </td>

                        <td>
                            <a href='http://weibo.com' title='新浪微博' target='_blank'>
                                <img src='images/ScrollAdPic/3.jpg' class="scrollImg" /></a>
                        </td>

                    </tr>
                </table>
            </td>
            <td id="colee_left2" valign="top"></td>
        </tr>
    </table>
</div>

<!-- 滚动javascript -->
<script type="text/javascript">
    //使用div时，请保证colee_left2与colee_left1是在同一行上.
    var speed=35 //速度数值越大速度越慢
    colee_left2.innerHTML=colee_left1.innerHTML
    function Marquee(){
        if(colee_left.scrollLeft>=colee_left1.scrollWidth){
            colee_left.scrollLeft=0
        }else{
            colee_left.scrollLeft++
        }
    }
    var MyMar=setInterval(Marquee,speed)
    colee_left.onmouseover=function() {clearInterval(MyMar)}
    colee_left.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
</script>
