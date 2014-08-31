<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-31
  Time: 下午1:35
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<div class="manageWebsite">
    <div class="manageIndexImages">
        <div class="title">修改主页动态图片</div>
        <s:form action="updateWebsiteImages" method="post" theme="simple" id="websiteImagesForm">
        <div class="imageLines">
            第一张：
            <s:hidden id="picHidden1" name="websiteImages1"/>
            <img src="<s:property value="websiteImages1"/>" id="productLogo1"/>
            <a class="btn btn-success change_Website_Img" href="websiteImgCrop.html?imageIndex=1">更改图片</a>
        </div>

        <div class="imageLines">
            第二张：
            <s:hidden id="picHidden2" name="websiteImages2"/>
            <img src="<s:property value="websiteImages2"/>" id="productLogo2"/>
            <a class="btn btn-success change_Website_Img" href="websiteImgCrop.html?imageIndex=2">更改图片</a>
        </div>

        <div class="imageLines">
            第三张：
            <s:hidden id="picHidden3" name="websiteImages3"/>
            <img src="<s:property value="websiteImages3"/>" id="productLogo3"/>
            <a class="btn btn-success change_Website_Img" href="websiteImgCrop.html?imageIndex=3">更改图片</a>
        </div>

        <div class="imageLines">
            第四张：
            <s:hidden id="picHidden4" name="websiteImages4"/>
            <img src="<s:property value="websiteImages4"/>" id="productLogo4"/>
            <a class="btn btn-success change_Website_Img" href="websiteImgCrop.html?imageIndex=4">更改图片</a>
        </div>

        <div class="imageLines">
            第五张：
            <s:hidden id="picHidden5" name="websiteImages5"/>
            <img src="<s:property value="websiteImages5"/>" id="productLogo5"/>
            <a class="btn btn-success change_Website_Img" href="websiteImgCrop.html?imageIndex=5">更改图片</a>
        </div>

        </s:form>
    </div>

    <div style="clear: both;">
        <button type="button" id="updateImageBtn" class="btn btn-primary btn-success">&nbsp;&nbsp;提交更改的图片&nbsp;&nbsp;</button>
        <span id="submit_msg" style="color:red; font-weight: bold;font-size: 13px"></span>
    </div>

</div>

<style>

    .manageWebsite{
        font-family: Tahoma, Geneva,"\5FAE\8F6F\96C5\9ED1","\5b8b\4f53",sans-serif;
    }
    .title{
        font-size: 15px;
        font-weight: bold;
        padding-left: 18px;
        letter-spacing: 1px;
        background: url(/images/lead_img.png) 2px 3px no-repeat;
        margin-bottom: 20px;
    }
    .manageIndexImages img{
        width: 150px;
        height: 93px;
        border: 2px solid white;
    }

    .imageLines{
        margin-bottom: 20px;
        width: 400px;
        float: left;
        padding-bottom: 5px;
        border-bottom: 1px dotted #7cfc00;
    }
</style>

<script type="text/javascript">
    $(document).ready(function(){
        //更换头像
        $(".change_Website_Img").fancybox({
            type:'iframe',
            width:730,
            height:490,
            padding:10,
            scrolling:"no",
            modal:true
        });
    });

    $("#updateImageBtn").click(function(){

        var url="updateWebsiteImages.html";
        var userData = $("#websiteImagesForm").serialize();
        $.post(url,userData,function(data)
        {
            $("#submit_msg").html("");
            if(data.equals("success")){$("#submit_msg").html("图片更改成功！");
            }else{$("#submit_msg").html("未知错误");}
        },"text");

    });

</script>