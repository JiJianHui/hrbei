/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-24 20:56
 * Email: jhji@ir.hit.edu.cn
 */

CKEDITOR.editorConfig = function( config )
{
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.height = 500;

    config.toolbar =
    [
//加粗     斜体，     下划线      穿过线      下标字        上标字
        ['Bold','Italic','Underline','Strike','Subscript','Superscript'],
//数字列表          实体列表            减小缩进    增大缩进
        ['NumberedList','BulletedList','-','Outdent','Indent'],
//左对齐             居中对齐          右对齐          两端对齐
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
//超链接 取消超链接 锚点
        ['Link','Unlink','Anchor'],
//图片    flash    表格       水平线            表情       特殊字符        分页符
        ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
        '/',
//样式       格式      字体    字体大小
        ['Styles','Format','Font','FontSize'],
//文本颜色     背景颜色
        ['TextColor','BGColor'],
//全屏           显示区块
        ['Maximize', 'ShowBlocks','-']
    ]
};