<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-24
  Time: 下午8:14
  Email: jhji@ir.hit.edu.cn
--%>

<script type="text/javascript">
    CKEDITOR.replace('news.content',
            {
                customConfig : '/jsp/layout/myCkeditor.js'
            }

    );

</script>

<script type="text/javascript">

    function checkNewsForm(){
        if( $("#author").attr('value').length == 0 || $("#author").attr('value').length > 100 ){
            $("#submit_msg_updateNews").html("请输入正确的作者。");
            return false;
        }
        if( $("#title").attr('value').length == 0 || $("#title").attr('value').length > 200 ){
            $("#submit_msg_updateNews").html("请输入正确的标题。");
            return false;
        }

//        if($("#content").attr('value').length == 0 ){
//            $("#submit_msg_updateNews").html("请输入新闻正文。");
//            return false;
//        }

        $("#submit_msg_updateNews").html("");
        $("#submit_msg_updateNews").html("");
        $("#submit_msg_updateNews").html("");

        return true;
    }

    $("#changeNewsBtn").click(function(){

        if(!checkNewsForm()) return;

        var url="updateUserNews.html";
        var userData = $("#updateNewsForm").serialize();

        $.post(url,userData,function(data)
        {
            $("#submit_msg_updateNews").html("");
            if(data.length != 0){$("#submit_msg_updateNews").html("新闻信息更新成功，请返回！");
            }else{$("#submit_msg_updateNews").html("新闻信息更新错误！");}
        },"text");

    });

    $("#changeCompanyNewsBtn").click(function(){
        if(!checkNewsForm()) return;

        var url="updateCompanyNews.html";
        var userData = $("#updateNewsForm").serialize();
        $.post(url,userData,function(data)
        {
            $("#submit_msg_updateNews").html("");
            if(data.length != 0){$("#submit_msg_updateNews").html("新闻信息更新成功，请返回！");
            }else{$("#submit_msg_updateNews").html("新闻信息更新错误！");}
        },"text");

    });

</script>