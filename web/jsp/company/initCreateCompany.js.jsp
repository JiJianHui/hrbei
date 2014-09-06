<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-17
  Time: 上午10:30
  Email: jhji@ir.hit.edu.cn
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">

    var uploading = false;
    var words_on_uploadButton = "更改";

    var row_count = 0;

$(document).ready(function () {

    $("#change_logo").uploadify({
        'uploader': 'js/uploadify/uploadify.swf',
        'script': 'utils/uploadFileWithOutZoom.html',
        'cancelImg': 'js/uploadify/cancel.png',
        'queueID': 'fileQueue', //和存放队列的DIV的id一致
        'fileDataName': 'fileupload', //和以下input的name属性一致
        'auto': true, //是否自动开始
        'multi': false, //是否支持多文件上传
        'buttonText': words_on_uploadButton, //按钮上的文字
        'simUploadLimit': 1, //一次同步上传的文件数目
        'sizeLimit': 2000000, //设置单个文件大小限制
        'queueSizeLimit': 1, //队列中同时存在的文件个数限制
        'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete: function (event, queueID, fileObj, response, data) {
            uploading = false;
            var jsonRep = $.parseJSON(response)
//            $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
            //alert(jsonRep.genFileName);
//            document.getElementById('warning1').innerHTML = jsonRep.genFileName;
            var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
            $("#logoImg").attr("src", "/upload/file/tmp/" + jsonRep.genFileName);
            document.getElementById('logoURL').value = jsonRep.genFileName;
        },
        onError: function (event, queueID, fileObj) {
            alert("file:" + fileObj.name + "upload failed");
        },
        onCancel: function (event, queueID, fileObj) {
        },
        onUploadStart: function (event, queueID, fileObj) {
            uploading = true;
        }
    });

    $("#change_profile").uploadify({
        'uploader': 'js/uploadify/uploadify.swf',
        'script': 'utils/uploadFileWithOutZoom.html',
        'cancelImg': 'js/uploadify/cancel.png',
        'queueID': 'fileQueue', //和存放队列的DIV的id一致
        'fileDataName': 'fileupload', //和以下input的name属性一致
        'auto': true, //是否自动开始
        'multi': false, //是否支持多文件上传
        'buttonText': words_on_uploadButton, //按钮上的文字
        'simUploadLimit': 1, //一次同步上传的文件数目
        'sizeLimit': 2000000, //设置单个文件大小限制
        'queueSizeLimit': 1, //队列中同时存在的文件个数限制
        'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete: function (event, queueID, fileObj, response, data) {
            uploading = false;
            var jsonRep = $.parseJSON(response)
            var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
            $("#homeImage").attr("src", "/upload/file/tmp/" + jsonRep.genFileName);
            document.getElementById('homeImgURL').value = jsonRep.genFileName;
        },
        onError: function (event, queueID, fileObj) {
            alert("file:" + fileObj.name + "upload failed");
        },
        onCancel: function (event, queueID, fileObj) {
        },
        onUploadStart: function (event, queueID, fileObj) {
            uploading = true;
        }
    });

    $("#change_AD").uploadify({
        'uploader': 'js/uploadify/uploadify.swf',
        'script': 'utils/uploadFileWithOutZoom.html',
        'cancelImg': 'js/uploadify/cancel.png',
        'queueID': 'fileQueue', //和存放队列的DIV的id一致
        'fileDataName': 'fileupload', //和以下input的name属性一致
        'auto': true, //是否自动开始
        'width':300,
        'multi': false, //是否支持多文件上传
        'buttonText': "增加新广告图片", //按钮上的文字
        'simUploadLimit': 1, //一次同步上传的文件数目
        'sizeLimit': 2000000, //设置单个文件大小限制
        'queueSizeLimit': 1, //队列中同时存在的文件个数限制
        'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete: function (event, queueID, fileObj, response, data) {
            uploading = false;
            var jsonRep = $.parseJSON(response)
//            $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
            //alert(jsonRep.genFileName);
//            document.getElementById('warning1').innerHTML = jsonRep.genFileName;
            var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
            $("#adImage").attr("src", "/upload/file/tmp/" + jsonRep.genFileName);
            document.getElementById('adImgURL').value = jsonRep.genFileName;

            var imagePath = "/upload/file/tmp/" + jsonRep.genFileName;
            var picHiddenPath =  jsonRep.genFileName;

            if( picHiddenPath.length == 0 || imagePath.length == 0 ) return;

            var rowId = "new"+row_count;

            var table = $('#imageTable');
            var row = $("<tr id='"+ rowId + "'></tr>");

            var td0 = $("<td class='imageCol'></td>");
            td0.append("<img src='" + imagePath + "'/>");

            var tdType = $("<td class='desCol'>公司主页广告</td>");

            var td1 = $("<td class='pathCol'></td>");
            td1.append($("<input name='adImages' value='"+picHiddenPath+"'/>"));

            var td2 = $("<td class='editCol'></td>");

            td2.append( $("<img src='/images/delete.jpg' class='newImage' >") );

            row.append(td0);
            row.append(tdType);
            row.append(td1);
            row.append(td2);
            table.append(row);

            row_count++;

        },
        onError: function (event, queueID, fileObj) {
            alert("file:" + fileObj.name + "upload failed");
        },
        onCancel: function (event, queueID, fileObj) {
        },
        onUploadStart: function (event, queueID, fileObj) {
            uploading = true;
        }
    });

    $(".newImage").die().live("click",function(event){
        var tdNode = window.event.srcElement.parentNode;
        var trNode = tdNode.parentNode;
        var tableNode = trNode.parentNode;
        tableNode.removeChild(trNode);

    });

});

    function checkCompanyForm(){
        return true;
    }

</script>