

<script type="text/javascript">

    $(document).ready(function(){
        //更换头像
        $("#change_product_portrait").fancybox({
            type:'iframe',
            width:730,
            height:490,
            padding:10,
            scrolling:"no",
            modal:true
        });
    });

</script>

<script type="text/javascript">

    function checkProInfoForm(){

        return true;
    }

    $("#changeProInfoBtn").click(function(){

        if(!checkProInfoForm()) return;

        var url="updateProductInfo.html";
        var userData = $("#productInfoForm").serialize();
        $.post(url,userData,function(data)
        {
            $("#submit_msg").html("");
            if(data.length != 0){$("#submit_msg").html("产品信息更改成功，请返回！");
            }else{$("#submit_msg").html("产品信息更改失败！！");}
        },"text");

    });
</script>