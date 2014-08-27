
<s:form id="deleteNewsForm" action="ajaxDeleteUserNews" method="post">
    <s:hidden name="news.id" id="deleteNewsId" />
</s:form>

<script type="text/javascript">

    function confirmDeleteNews (id,statusName) {
        if(confirm("确定删除该商品: " + statusName))
        {
            document.getElementById("deleteNewsId").value = id;

            var url="ajaxDeleteUserNews.html";
            var userData = $("#deleteNewsForm").serialize();

            $.post(url,userData,function(data)
            {
                if(data=="success"){
                    alert("删除成功");
                    window.location.reload();
                }else{
                    alert("删除失败！");
                }
            },"text");
        }
    }

</script>