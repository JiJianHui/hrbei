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